-- UI and appearance-related plugins
return {
  -- Themes
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
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

  -- Status line
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

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│' },
      scope = { enabled = true },
    },
  },

  -- Dashboard
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

  -- Enhanced UI components
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

  -- Notifications
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

  -- Better UI for inputs
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
          telescope = require('telescope.themes').get_dropdown(),
        },
      }
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- for example
      provider = 'copilot',
      openai = {
        model = 'claude-3.5-sonnet', -- your desired model (or use gpt-4o, etc.)
        temperature = 0, -- adjust if needed
        max_tokens = 4096,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'echasnovski/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  -- GitHub Copilot Chat
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   dependencies = {
  --     { 'github/copilot.vim' },
  --     { 'nvim-lua/plenary.nvim' },
  --   },
  --   build = function()
  --     -- Only attempt to build tiktoken on macOS or Linux
  --     if vim.fn.has('mac') == 1 or vim.fn.has('unix') == 1 then
  --       vim.cmd('silent! !make tiktoken')
  --     end
  --   end,
  --   opts = {
  --     model = 'claude-3.7-sonnet', -- Set Claude 3.7 Sonnet as default model
  --     debug = false,
  --     show_help = true,
  --     window = {
  --       layout = 'vertical',
  --       width = 0.5,
  --       height = 0.5,
  --       border = 'single',
  --       title = 'Copilot Chat',
  --     },
  --     mappings = {
  --       submit_prompt = {
  --         normal = '<Leader>cc',
  --         insert = '<C-s>',
  --       },
  --       close = {
  --         normal = 'q',
  --         insert = '<C-c>',
  --       },
  --     },
  --   },
  --   -- Lazy load on commands
  --   cmd = {
  --     'CopilotChat',
  --     'CopilotChatOpen',
  --     'CopilotChatToggle',
  --     'CopilotChatExplain',
  --     'CopilotChatFix',
  --     'CopilotChatOptimize',
  --     'CopilotChatTests',
  --     'CopilotChatReview',
  --     'CopilotChatAgents',
  --     'CopilotChatModels',
  --     'CopilotChatPrompts',
  --   },
  --   keys = {
  --     { '<Leader>cc', '<cmd>CopilotChatToggle<CR>', desc = 'Toggle Copilot Chat' },
  --     { '<Leader>ce', '<cmd>CopilotChatExplain<CR>', desc = 'Explain Code with Copilot' },
  --     { '<Leader>cf', '<cmd>CopilotChatFix<CR>', desc = 'Fix Code with Copilot' },
  --     { '<Leader>co', '<cmd>CopilotChatOptimize<CR>', desc = 'Optimize Code with Copilot' },
  --     { '<Leader>ct', '<cmd>CopilotChatTests<CR>', desc = 'Generate Tests with Copilot' },
  --     { '<Leader>cr', '<cmd>CopilotChatReview<CR>', desc = 'Review Code with Copilot' },
  --   },
  -- },
}
