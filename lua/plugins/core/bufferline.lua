-- Better buffer management
return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'none',
      diagnostics = 'nvim_lsp',
      separator_style = 'thin', -- Changed from 'slant'
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      always_show_bufferline = true,
      indicator = {
        -- icon = '▎', -- Icon removed as style is changing
        style = 'underline', -- Changed from 'icon'
      },
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      truncate_names = false, -- Explicitly disable truncation
      -- max_name_length = 18, -- Removed limit
      -- max_prefix_length = 15, -- Removed limit
      -- tab_size = 18, -- Removed limit
      -- offsets = { -- Commented out for testing buffer visibility
      --   {
      --     filetype = 'NvimTree',
      --     text = 'File Explorer',
      --     highlight = 'Directory',
      --     separator = true,
      --   },
      -- },
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
}