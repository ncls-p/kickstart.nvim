-- Notifications and UI enhancements
return {
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
          view = 'cmdline_popup',
          format = {
            cmdline = { icon = '>' },
            search_down = { icon = '🔍⌄' },
            search_up = { icon = '🔍⌃' },
            filter = { icon = '$' },
            lua = { icon = '☾' },
            help = { icon = '?' },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
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
        stages = 'fade',
        icons = {
          ERROR = '❌',
          WARN = '⚠️',
          INFO = 'ℹ️',
          DEBUG = '🔧',
          TRACE = '📝',
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
          default_prompt = '🔍 ',
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
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = 'sine',
        pre_hook = nil,
        post_hook = nil,
      }
    end,
  },

  -- Add a minimap
  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require 'codewindow'
      codewindow.setup {
        active_in_terminals = false,
        auto_enable = false,
        exclude_filetypes = {
          'help',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
          'alpha',
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
      }
      -- Toggle minimap keymapping
      vim.keymap.set('n', '<leader>mm', function()
        codewindow.toggle_minimap()
      end, { desc = '🗺️ Toggle [M]ini[m]ap' })
    end,
  },
}
