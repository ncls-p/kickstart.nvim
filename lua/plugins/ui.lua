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
          navic = true,
          mason = true,
          noice = true,
          notify = true,
          lsp_trouble = true,
        },
      }
      -- Set colorscheme after setup
      vim.cmd.colorscheme "catppuccin"
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
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          disabled_filetypes = { 'alpha' },
        },
        sections = {
          lualine_a = { 
            { 'mode', separator = { left = '' }, right_padding = 2 } 
          },
          lualine_b = { 
            { 'branch', icon = '' },
            { 'diff', 
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = '#98be65' },
                modified = { fg = '#ECBE7B' },
                removed = { fg = '#ec5f67' },
              },
            },
            { 
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            },
          },
          lualine_c = { 
            { 'filename', path = 1, file_status = true, symbols = { modified = '●', readonly = '', unnamed = '[No Name]' } } 
          },
          lualine_x = { 
            { 'encoding' },
            { 'fileformat', symbols = { unix = ' ', dos = ' ', mac = ' '} },
            { 'filetype', colored = true, icon_only = false },
          },
          lualine_y = { 
            { 'progress', separator = { right = '' }, left_padding = 2 } 
          },
          lualine_z = { 
            { 'location', separator = { right = '' }, left_padding = 2 } 
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'neo-tree', 'lazy', 'mason', 'trouble' },
      }
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│', highlight = "IblIndent" },
      scope = { enabled = true, show_start = true, show_end = true },
    },
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local db = require("dashboard")
      
      db.setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            { desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
            { desc = " Apps", group = "DiagnosticHint", action = "Telescope app", key = "a" },
            { desc = " Recent", group = "Number", action = "Telescope oldfiles", key = "r" },
            { desc = " Search", group = "Function", action = "Telescope live_grep", key = "t" },
            { desc = " Config", group = "String", action = "e $MYVIMRC", key = "c" },
            { desc = "󰗼 Exit", group = "Error", action = "qa", key = "q" },
          },
          project = { enable = true, limit = 8, icon = " ", label = "Recent Projects", action = "Telescope find_files cwd=" },
          mru = { limit = 10, icon = " ", label = "Recent Files" },
          footer = {
            "",
            "NCLS Neovim - Modern and Professional"
          },
        },
      })
    end,
  },

  -- Buffer line (tabs)
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          mode = "buffers",
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 22,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icons = { error = " ", warning = " ", info = " ", hint = " " }
            return " " .. icons[level] .. count
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            }
          },
          color_icons = true,
          separator_style = "thin",
          always_show_bufferline = false,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
        },
      }
    end,
    keys = {
      { "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Close buffer" },
      { "<leader>bse", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" },
      { "<leader>bsd", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
    },
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
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true,
              luasnip = true,
              throttle = 50,
            },
          },
          hover = {
            enabled = true,
            silent = false,
            view = nil,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = { icon = ">" },
            search_down = { icon = "🔍⌄" },
            search_up = { icon = "🔍⌃" },
            filter = { icon = "$" },
            lua = { icon = "☾" },
            help = { icon = "?" },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
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
        render = 'default',
        stages = "fade",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
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

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "sine",
        pre_hook = nil,
        post_hook = nil,
      })
    end
  },

  -- Add a minimap
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup({
        active_in_terminals = false,
        auto_enable = false,
        exclude_filetypes = {
          'help', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason', 'alpha',
        },
        max_minimap_height = nil,
        max_lines = nil,
        minimap_width = 15,
        use_lsp = true,
        use_treesitter = true,
        use_git = true,
        width_multiplier = 3,
        z_index = 1,
        show_cursor = true,
        window_border = 'none',
      })
      -- Toggle minimap keymapping
      vim.keymap.set('n', '<leader>mm', function()
        codewindow.toggle_minimap()
      end, { desc = 'Toggle Minimap' })
    end,
  },

  -- Window animations
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
    },
    config = function()
      require('windows').setup({
        autowidth = { 
          enable = true,
          winwidth = 0,
          filetype = {
            help = 2,
          },
        },
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'NvimTree', 'neo-tree', 'dashboard', 'Outline', 'alpha', 'dashboard' }
        },
        animation = {
          enable = true,
          duration = 300,
          fps = 60,
          easing = "in_out_sine"
        }
      })
    end
  },

  -- Better file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "none",
            ["l"] = "open",
            ["h"] = "close_node",
          }
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
        },
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "*",
          },
          modified = {
            symbol = "●",
            highlight = "NeoTreeModified",
          },
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
      })
      
      -- Key mappings
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Explorer' })
      vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<CR>', { desc = 'Focus Explorer' })
    end,
  },

  -- LSP progress indicator
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "moon",
      },
      align = {
        bottom = true,
      },
      window = {
        relative = "editor",
        blend = 0,
      },
    },
  },

  -- AI assistants
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      provider = 'copilot',
      openai = {
        model = 'claude-3.5-sonnet',
        temperature = 0,
        max_tokens = 4096,
      },
    },
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'echasnovski/mini.pick',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
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
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
