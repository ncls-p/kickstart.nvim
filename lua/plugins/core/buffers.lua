-- Buffer management
return {
  -- Buffer management with simplified configuration
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        separator_style = 'thin',
        show_buffer_close_icons = true,
        color_icons = true,
        indicator = { style = 'icon' },
        modified_icon = '*',
        max_name_length = 18,
        tab_size = 18,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Files',
            separator = true,
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Essential buffer keymaps
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = 'Buffer Pick' })
      vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', { desc = 'Buffer Close' })
    end,
  },
}
