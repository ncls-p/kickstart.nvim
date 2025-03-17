-- Core Neovim configuration
-- This module loads all the core settings

-- Load core settings
require('core.options')  -- Basic Neovim options
require('core.autocmds') -- Autocommands

-- Add any other core modules here as your configuration grows
-- For example:
-- require('core.commands') -- Custom commands

return {
  -- Export any functions that might be needed elsewhere
}