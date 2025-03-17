-- LSP configuration and setup
return {
  -- LSP Development
  { 'folke/lazydev.nvim', ft = 'lua' },

  -- Core LSP setup
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
          map('gd', require('telescope.builtin').lsp_definitions, '🔍 [G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '📚 [G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '⚙️ [G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '📜 [G]oto [D]eclaration')
          map('K', vim.lsp.buf.hover, 'ℹ️ Hover Documentation')
          map('<C-k>', vim.lsp.buf.signature_help, '📝 Signature Documentation')
          map('<leader>rn', vim.lsp.buf.rename, '✏️ [R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '🔧 [C]ode [A]ction', { 'n', 'v' })
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, '🏷️ Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '🔍 [D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '🌐 [W]orkspace [S]ymbols')
          map('<leader>wa', vim.lsp.buf.add_workspace_folder, '📁 [W]orkspace [A]dd Folder')
          map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '🗑️ [W]orkspace [R]emove Folder')
          map('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '📋 [W]orkspace [L]ist Folders')
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '❌ ',
            [vim.diagnostic.severity.WARN] = '⚠️ ',
            [vim.diagnostic.severity.INFO] = 'ℹ️ ',
            [vim.diagnostic.severity.HINT] = '💡 ',
          },
        },
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
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
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
                command = 'clippy',
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
        'stylua', -- Lua formatter
        'prettier', -- JS/TS/React/HTML/CSS/JSON/YAML formatter
        'eslint_d', -- JS/TS/React linter
        'ruff', -- Python linter and formatter
        'markdownlint', -- Markdown linter
        'google-java-format', -- Java formatter
        'rustfmt', -- Rust formatter
        'goimports', -- Go imports formatter
        'clang-format', -- C/C++ formatter
        'php-cs-fixer', -- PHP formatter
        'ktlint', -- Kotlin formatter/linter
        'shfmt', -- Shell formatter

        -- Linters
        'solhint', -- Solidity linter
        'htmlhint', -- HTML linter
        'stylelint', -- CSS linter
        'golangci-lint', -- Go linter
        'phpcs', -- PHP linter
        'tflint', -- Terraform linter
        'yamllint', -- YAML linter
        'shellcheck', -- Shell linter
        'hadolint', -- Dockerfile linter

        -- DevOps specific tools
        'helm-ls', -- Helm language server
        'docker-compose-language-service', -- Docker Compose language server
        'terraform-ls', -- Terraform language server
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
      if vim.fn.has 'mac' == 1 then
        local sourcekit_server = servers['sourcekit_lsp'] or {}
        sourcekit_server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, sourcekit_server.capabilities or {})
        require('lspconfig')['sourcekit'].setup(sourcekit_server)
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
        desc = '✨ [F]ormat buffer',
      },
    },
    init = function()
      -- Create a .prettierrc file in the Neovim config directory if it doesn't exist
      local prettier_config_path = vim.fn.stdpath 'config' .. '/.prettierrc'
      if vim.fn.filereadable(prettier_config_path) == 0 then
        local prettier_config = {
          printWidth = 100,
          tabWidth = 2,
          useTabs = false,
          semi = true,
          singleQuote = true,
          trailingComma = 'es5',
          bracketSpacing = true,
          arrowParens = 'avoid',
          endOfLine = 'lf',
        }
        local file = io.open(prettier_config_path, 'w')
        if file then
          file:write(vim.json.encode(prettier_config))
          file:close()
          vim.notify('Created default .prettierrc in ' .. vim.fn.stdpath 'config', vim.log.levels.INFO)
        end
      end
    end,
    opts = {
      -- Define a function to determine if prettier should be used
      formatters_by_ft = (function()
        -- List of filetypes that prettier supports
        local prettier_filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'vue',
          'css',
          'scss',
          'less',
          'html',
          'json',
          'jsonc',
          'yaml',
          'markdown',
          'markdown.mdx',
          'graphql',
          'handlebars',
          'svelte',
          'xml',
          'dockerfile',
          -- DevOps related files
          'yaml.docker-compose',
          'yaml.helm',
          'hcl',
          'terraform',
        }

        -- Create a table to store the formatter configuration
        local formatters = {
          lua = { 'stylua' },
          python = { 'ruff_format', 'ruff_fix' },
          java = { 'google_java_format' },
          rust = { 'rustfmt' },
          scala = { 'scalafmt' },
          solidity = {},
          go = { 'goimports' },
          c = { 'clang_format' },
          cpp = { 'clang_format' },
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
        async = true,
      },
    },
  },
}

