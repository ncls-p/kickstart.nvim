-- Keybindings module
-- This centralizes all keybindings for easier management

local M = {}

-- VSCode-specific keymaps
function M.setup_vscode_keys()
  -- Load VSCode specific keybindings (now always active)
  require('keymaps.vscode').setup()
end

-- Set up general keymaps that apply to all Neovim instances
function M.setup()
  -- Navigation
  vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window' })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window' })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
  
  -- Resize windows
  vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
  vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
  vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
  vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })
  
  -- Buffer navigation
  -- vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' }) -- Handled by bufferline
  -- vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' }) -- Handled by bufferline
  
  -- Quick exit
  vim.keymap.set('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit' })
  vim.keymap.set('n', '<leader>qa', '<cmd>qa!<CR>', { desc = 'Quit all' })
  
  -- Add more general keybindings as needed
end

-- Load mode-specific keymaps
M.setup_vscode_keys()
M.setup()

return M
