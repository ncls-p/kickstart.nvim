-- Editing utilities
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  
  -- Mini plugins for essential editing features
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Text objects for better selection
      require('mini.ai').setup { n_lines = 500 }
      
      -- Add/change/delete surrounding pairs
      require('mini.surround').setup()
      
      -- Auto-pair brackets and quotes
      require('mini.pairs').setup()
      
      -- Commenting functionality
      require('mini.comment').setup {
        mappings = {
          comment = 'gc',
          comment_line = 'gcc',
          textobject = 'gc',
        },
      }
      
      -- Indentation guides
      require('mini.indentscope').setup {
        symbol = '│',
        options = { try_as_border = true },
      }
    end,
  },
  
  -- Multi-cursor support (for VSCode-like multiple selections)
  { 'mg979/vim-visual-multi', branch = 'master' },
  
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
    end,
  },
}
