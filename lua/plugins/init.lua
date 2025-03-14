-- Plugin management and configuration
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
local plugins = {
  -- Core plugins
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'folke/which-key.nvim', event = 'VimEnter', opts = { delay = 0 } },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Previous hunk' })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Stage selected hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Reset selected hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = true }
        end, { desc = 'Blame line' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle blame' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diff this' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'Diff this ~' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle deleted' })
      end,
    },
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          path_display = { 'truncate' },
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
          },
          file_ignore_patterns = { 'node_modules', '.git/' },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
          },
        },
        extensions = {
          ['ui-select'] = function()
            return require('telescope.themes').get_dropdown()
          end,
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Telescope keymaps
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },

  -- Better buffer management
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        always_show_bufferline = true,
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Bufferline keymaps
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })
      vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', { desc = '[B]uffer Pick [C]lose' })
      vim.keymap.set('n', '<leader>bs', '<cmd>BufferLineSortByDirectory<CR>', { desc = '[B]uffer [S]ort by directory' })
    end,
  },

  -- LSP Support
  { 'folke/lazydev.nvim', ft = 'lua' },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- LSP attach handler
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- LSP keymaps
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'v' })
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          map('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded' },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
      }

      -- Server configuration
      local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { globals = { 'vim' } },
              workspace = {
                library = {
                  [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                  [vim.fn.stdpath 'config' .. '/lua'] = true,
                },
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        -- React
        eslint = {},
        -- Java
        jdtls = {},
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        -- Markdown
        marksman = {},
        -- Rust
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
        -- Scala is handled by nvim-metals plugin
        -- Solidity
        solidity = {},
        -- HTML/CSS
        html = {},
        cssls = {},
        -- JSON
        jsonls = {},
        -- YAML
        yamlls = {},
        -- Go
        gopls = {},
        -- C/C++
        clangd = {},
        -- Ruby
        solargraph = {},
        -- PHP
        intelephense = {},
        -- Swift
        -- sourcekit is built into macOS and doesn't need to be installed via Mason
        -- We'll set it up manually outside of Mason
        -- Kotlin
        kotlin_language_server = {},
        -- Terraform
        terraformls = {},
        -- Docker
        dockerls = {},
        -- GraphQL
        graphql = {},
      }

      -- Install servers and tools
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 
        -- Language servers
        -- Formatters
        'stylua',                -- Lua formatter
        'prettier',              -- JS/TS/React/HTML/CSS/JSON/YAML formatter
        'eslint_d',              -- JS/TS/React linter
        'ruff',                  -- Python linter and formatter
        'markdownlint',          -- Markdown linter
        'google-java-format',    -- Java formatter
        'rustfmt',               -- Rust formatter
        'gofmt',                 -- Go formatter
        'goimports',             -- Go imports formatter
        'clang-format',          -- C/C++ formatter
        'rubocop',               -- Ruby formatter/linter
        'php-cs-fixer',          -- PHP formatter
        'swiftformat',           -- Swift formatter
        'ktlint',                -- Kotlin formatter/linter
        'terraform-fmt',         -- Terraform formatter
        'shfmt',                 -- Shell formatter
        
        -- Linters
        'solhint',               -- Solidity linter
        'htmlhint',              -- HTML linter
        'stylelint',             -- CSS linter
        'golangci-lint',         -- Go linter
        'cppcheck',              -- C/C++ linter
        'phpcs',                 -- PHP linter
        'tflint',                -- Terraform linter
        'yamllint',              -- YAML linter
        'shellcheck',            -- Shell linter
        'hadolint',              -- Dockerfile linter
        
        -- DevOps specific tools
        'helm-ls',               -- Helm language server
        'docker-compose-language-service', -- Docker Compose language server
        'terraform-ls',          -- Terraform language server
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            
            -- Set up the server
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
      
      -- Set up sourcekit manually since it's not available via Mason
      if vim.fn.has("mac") == 1 then
        local sourcekit_server = servers["sourcekit_lsp"] or {}
        sourcekit_server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, sourcekit_server.capabilities or {})
        require('lspconfig')["sourcekit"].setup(sourcekit_server)
      end
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              buffer = '[Buffer]',
              path = '[Path]',
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp', group_index = 0 },
          { name = 'luasnip', group_index = 1 },
          { name = 'buffer', group_index = 2 },
          { name = 'path', group_index = 2 },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },

  -- Formatting
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        desc = '[F]ormat buffer',
      },
    },
    init = function()
      -- Create a .prettierrc file in the Neovim config directory if it doesn't exist
      local prettier_config_path = vim.fn.stdpath("config") .. "/.prettierrc"
      if vim.fn.filereadable(prettier_config_path) == 0 then
        local prettier_config = {
          printWidth = 100,
          tabWidth = 2,
          useTabs = false,
          semi = true,
          singleQuote = true,
          trailingComma = "es5",
          bracketSpacing = true,
          arrowParens = "avoid",
          endOfLine = "lf"
        }
        local file = io.open(prettier_config_path, "w")
        if file then
          file:write(vim.json.encode(prettier_config))
          file:close()
          vim.notify("Created default .prettierrc in " .. vim.fn.stdpath("config"), vim.log.levels.INFO)
        end
      end
    end,
    opts = {
      -- Define a function to determine if prettier should be used
      formatters_by_ft = (function()
        -- List of filetypes that prettier supports
        local prettier_filetypes = {
          "javascript", "javascriptreact", "typescript", "typescriptreact",
          "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown",
          "markdown.mdx", "graphql", "handlebars", "svelte", "xml", "dockerfile",
          -- DevOps related files
          "yaml.docker-compose", "yaml.helm", "hcl", "terraform"
        }
        
        -- Create a table to store the formatter configuration
        local formatters = {
          lua = { 'stylua' },
          python = { 'ruff_format', 'ruff_fix' },
          java = { 'google_java_format' },
          rust = { 'rustfmt' },
          scala = { 'scalafmt' },
          solidity = { },
          go = { 'gofmt', 'goimports' },
          c = { 'clang_format' },
          cpp = { 'clang_format' },
          ruby = { 'rubocop' },
          php = { 'php_cs_fixer' },
          swift = { 'swiftformat' },
          kotlin = { 'ktlint' },
          terraform = { 'terraform_fmt' },
          hcl = { 'terraform_fmt' }, -- HCL files (Terraform, Packer, etc.)
          dockerfile = { 'prettier' },
          sh = { 'shfmt' },
          bash = { 'shfmt' },
          zsh = { 'shfmt' },
        }
        
        -- Set prettier as the formatter for all supported filetypes
        for _, ft in ipairs(prettier_filetypes) do
          formatters[ft] = { 'prettier' }
        end
        
        return formatters
      end)(),
      format_on_save = { 
        timeout_ms = 1000, 
        lsp_format = 'fallback',
        async = true 
      },
    },
  },

  -- UI Enhancements
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- Note: The actual theme configuration is now handled by the settings module
      -- This is just the initial setup, which will be overridden by settings
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
          percentage = 0.15,
        },
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          bufferline = true,
          indent_blankline = { enabled = true },
          mini = true,
        },
      }
      -- The colorscheme will be set by the settings module
    end,
  },

  -- Additional themes
  { 'folke/tokyonight.nvim', lazy = true, priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = true, priority = 1000 },
  { 'EdenEast/nightfox.nvim', lazy = true, priority = 1000 },
  { 'rebelot/kanagawa.nvim', lazy = true, priority = 1000 },

  -- Theme manager
  {
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup {
        -- List of themes to use
        themes = {
          {
            name = 'Catppuccin Mocha',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "mocha"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Mocha (Transparent)',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "mocha"
              require("catppuccin").setup({
                transparent_background = true
              })
            ]],
          },
          {
            name = 'Catppuccin Macchiato',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "macchiato"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Frappe',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "frappe"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Latte',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "latte"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Tokyo Night',
            colorscheme = 'tokyonight',
          },
          {
            name = 'Tokyo Night Storm',
            colorscheme = 'tokyonight-storm',
          },
          {
            name = 'Tokyo Night Day',
            colorscheme = 'tokyonight-day',
          },
          {
            name = 'Rose Pine',
            colorscheme = 'rose-pine',
          },
          {
            name = 'Rose Pine Moon',
            colorscheme = 'rose-pine-moon',
          },
          {
            name = 'Rose Pine Dawn',
            colorscheme = 'rose-pine-dawn',
          },
          {
            name = 'Nightfox',
            colorscheme = 'nightfox',
          },
          {
            name = 'Duskfox',
            colorscheme = 'duskfox',
          },
          {
            name = 'Kanagawa',
            colorscheme = 'kanagawa',
          },
        },
        livePreview = true,
      }

      -- Add keymap to open Themery
      vim.keymap.set('n', '<leader>ts', '<cmd>Themery<CR>', { desc = '[T]heme [S]elector' })
    end,
  },

  -- Modern UI components
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },

  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {
    indent = { char = '│' },
    scope = { enabled = true },
  } },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          width = 30,
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
            glyphs = {
              git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '★',
                deleted = '',
                ignored = '◌',
              },
            },
          },
          indent_markers = {
            enable = true,
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            window_picker = {
              enable = true,
            },
          },
        },
      }
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file [E]xplorer' })
      vim.keymap.set('n', '<leader>o', '<cmd>NvimTreeFocus<CR>', { desc = 'F[o]cus file explorer' })
    end,
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Mini plugins collection
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.comment').setup {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Toggle comment (like `gcip` - comment inner paragraph) for both
          -- Normal and Visual modes
          comment = 'gc',
          -- Toggle comment on current line
          comment_line = 'gcc',
          -- Define 'comment' textobject (like `dgc` - delete whole comment block)
          textobject = 'gc',
        },
      }
      require('mini.indentscope').setup {
        symbol = '│',
        options = { try_as_border = true },
      }
      -- We're using lualine instead of mini.statusline
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'lua',
          'markdown',
          'vim',
          'vimdoc',
          'javascript',
          'typescript',
          'tsx',
          'python',
          'html',
          'css',
          'json',
          'java',
          'yaml',
          'regex',
          'markdown_inline',
          'jsdoc',
          'rust',
          'scala',
          'solidity',
          'go',
          'ruby',
          'php',
          'swift',
          'kotlin',
          'hcl',  -- Terraform, Packer, etc.
          'dockerfile',
          'graphql',
          'sql',
          'toml',
          'xml',
          'make',  -- Makefiles
          'cmake',  -- CMake files
          -- 'kustomize', -- Kubernetes Kustomize (not available yet)
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      }
    end,
  },

  -- Modern UI enhancements
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      }
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#000000',
        timeout = 3000,
        max_width = 80,
        render = 'wrapped-compact',
      }
      vim.notify = require 'notify'
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = function()
      return {
        input = {
          enabled = true,
          default_prompt = '➤ ',
          win_options = {
            winblend = 10,
            winhighlight = 'Normal:Normal,NormalNC:Normal',
          },
        },
        select = {
          enabled = true,
          backend = { 'telescope', 'fzf', 'builtin' },
          telescope = function()
            return require('telescope.themes').get_dropdown()
          end,
        },
      }
    end,
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[    ███╗   ██╗ ██████╗██╗     ███████╗██████╗                       ]],
        [[    ████╗  ██║██╔════╝██║     ██╔════╝██╔══██╗                      ]],
        [[    ██╔██╗ ██║██║     ██║     ███████╗██████╔╝                      ]],
        [[    ██║╚██╗██║██║     ██║     ╚════██║██╔═══╝                       ]],
        [[    ██║ ╚████║╚██████╗███████╗███████║██║                           ]],
        [[    ╚═╝  ╚═══╝ ╚═════╝╚══════╝╚══════╝╚═╝                           ]],
        [[    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗             ]],
        [[    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║             ]],
        [[    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║             ]],
        [[    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║             ]],
        [[    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║             ]],
        [[    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝             ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Configuration', ':e $MYVIMRC <CR>'),
        dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
      }

      dashboard.section.footer.val = 'NCLSP - Neovim Configuration Language Server'

      dashboard.config.opts.noautocmd = true

      require('alpha').setup(dashboard.config)
    end,
  },

  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15 -- Set height to 15 lines (adjust as needed)
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4 -- 40% of screen width
          end
        end,
        open_mapping = [[<c-`>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal', -- Changed from 'float' to 'horizontal'
        close_on_exit = true,
        shell = vim.o.shell,
        -- Remove the float_opts since we're using horizontal layout
      }

      -- Add a function to toggle terminal with <C-j> as well
      function _G.toggle_terminal()
        local term = require('toggleterm.terminal').get(1)
        if term and term:is_open() then
          term:close()
        else
          require('toggleterm').toggle(1, 15, vim.fn.getcwd(), 'horizontal')
        end
      end

      -- Map the VSCode keybinding to toggle the terminal
      vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua toggle_terminal()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<C-j>', '<cmd>lua toggle_terminal()<CR>', { noremap = true, silent = true })
    end,
  },

  -- Multi-cursor support (for VSCode-like multiple selections)
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Import custom plugins
  { import = 'custom.plugins' },
}

-- Plugin manager configuration
local opts = {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      plugin = '🔌',
    },
    border = 'rounded',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

-- Initialize lazy.nvim
require('lazy').setup(plugins, opts)
