-- Neovim Configuration
---------------------------------------------------------------
-- A clean, modular, and easy-to-maintain Neovim configuration
---------------------------------------------------------------

-- Load core modules
require 'core.options' -- Basic Neovim options
require 'core.autocmds' -- Autocommands
local keymaps = require 'keymaps' -- Key mappings

-- Load plugins
require 'plugins'

-- Setup VSCode-like keybindings
keymaps.setup_vscode_keys()

-- Add Copilot Chat toggle keybinding
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })

-- Additional user configuration can be added here
