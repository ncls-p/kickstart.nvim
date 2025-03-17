-- Core editing plugins
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  
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
