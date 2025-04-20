-- Notification and UI enhancement components
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
          -- Keep only essential LSP overrides
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
          },
          signature = { enabled = true },
          hover = { enabled = true },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          lsp_doc_border = true,
        },
        cmdline = {
          enabled = true,
          view = 'cmdline_popup',
          format = {
            cmdline = { icon = '>' },
            search_down = { icon = '/' },
            search_up = { icon = '?' },
          },
        },
        -- Simplified views
        views = {
          cmdline_popup = {
            border = { style = 'rounded' },
          },
        },
      }
    end,
  },

  -- Simplified notifications
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        timeout = 2000,
        max_width = 60,
        render = 'minimal',
        stages = 'fade',
        icons = {
          ERROR = 'E',
          WARN = 'W',
          INFO = 'I',
          DEBUG = 'D',
          TRACE = 'T',
        },
      }
      vim.notify = require 'notify'
    end,
  },

  -- Simplified UI for inputs
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        enabled = true,
        default_prompt = '> ',
      },
      select = {
        enabled = true,
        backend = { 'telescope' },
        telescope = require('telescope.themes').get_dropdown(),
      },
    },
  },

  -- LSP progress indicator
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'LspAttach',
    opts = {
      text = { spinner = 'dots' },
      window = { blend = 0 },
    },
  },
}
