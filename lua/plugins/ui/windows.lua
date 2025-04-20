-- Window management and visual components
return {
  -- Window animations with minimal configuration
  {
    'anuvyklack/windows.nvim',
    dependencies = { 'anuvyklack/middleclass' },
    config = function()
      require('windows').setup {
        autowidth = { enable = true },
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'neo-tree', 'dashboard' },
        },
        animation = {
          enable = true,
          duration = 200,
        },
      }
    end,
  },
  
  -- Add a minimap with simplified options
  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require 'codewindow'
      codewindow.setup {
        auto_enable = false,
        minimap_width = 10,
        use_lsp = true,
        use_treesitter = true,
        exclude_filetypes = { 'help', 'dashboard', 'neo-tree' },
      }
      -- Simplified toggle minimap mapping
      vim.keymap.set('n', '<leader>m', function()
        codewindow.toggle_minimap()
      end, { desc = 'Toggle Minimap' })
    end,
  },

  -- Simplified scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>', '<C-f>', '<C-b>' },
        hide_cursor = true,
        easing_function = 'sine',
      }
    end,
  },
}
