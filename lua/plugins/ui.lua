-- UI and appearance-related plugins
-- This file now imports from the modular UI components
return {
  -- Import all the modular UI components
  require('plugins.ui.themes'),      -- Theme components
  require('plugins.ui.focus'),       -- Focus-related components
  require('plugins.ui.statusline'),  -- Status line and buffer line
  require('plugins.ui.windows'),     -- Window management
  require('plugins.ui.notifications'), -- Notifications
  require('plugins.ui.dashboard'),   -- Dashboard
  require('plugins.ui.diagnostics'), -- Diagnostics UI (Trouble)
  
  -- File explorer is already in its own module
}
