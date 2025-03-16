-- Core plugins that provide essential functionality
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  
  -- Which-key for keybinding help
  { 
    'folke/which-key.nvim', 
    event = 'VimEnter', 
    opts = { 
      delay = 0 
    } 
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
