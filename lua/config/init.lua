-- Main configuration module
local M = {}

function M.setup()
  -- Load core modules
  require('core.options')  -- Basic Neovim options
  require('core.autocmds') -- Autocommands
  
  -- Load keymaps
  local keymaps = require('keymaps')
  keymaps.setup_vscode_keys()
  
  -- Load Copilot configuration
  require('config.copilot').setup()
  
  -- Additional user configuration can be added here
end

return M
