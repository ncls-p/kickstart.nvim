-- Mini plugins collection
return {
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
}