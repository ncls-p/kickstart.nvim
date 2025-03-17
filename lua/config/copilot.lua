-- Copilot configuration
local M = {}

function M.setup()
  -- Add Copilot Chat toggle keybinding
  vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
end

return M
