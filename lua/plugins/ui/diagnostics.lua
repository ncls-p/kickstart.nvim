-- Diagnostics UI (Problems Panel)
return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- Use your preferred icons
      icons = true,
      mode = 'workspace_diagnostics', -- "workspace_diagnostics" or "document_diagnostics"
      position = 'bottom', -- "bottom", "top", "left", "right"
      height = 10, -- Height of the trouble list when position is bottom or top
      width = 50, -- Width of the list when position is left or right
      auto_open = false, -- Automatically open the list when diagnostics are detected
      auto_close = false, -- Automatically close the list when diagnostics are fixed
      auto_preview = true, -- Automatically preview the location of the diagnostic. <esc> to close preview window.
    },
    config = function(_, opts)
      require('trouble').setup(opts)
      -- Keymaps for Trouble
      vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle workspace_diagnostics<CR>', { desc = 'Workspace Diagnostics (Trouble)' })
      vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>', { desc = 'Document Diagnostics (Trouble)' })
      vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>', { desc = 'Location List (Trouble)' })
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', { desc = 'Quickfix List (Trouble)' })
      vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>', { desc = 'LSP References (Trouble)' })
    end,
  },
}