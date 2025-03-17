-- UI plugins initialization
-- This file imports all UI-related plugin modules

return {
  -- Import all UI modules
  { import = 'plugins.ui.themes' },        -- Themes and colorschemes
  { import = 'plugins.ui.statusline' },    -- Status line, bufferline, and indent guides
  { import = 'plugins.ui.dashboard' },     -- Dashboard
  { import = 'plugins.ui.explorer' },      -- File explorer
  { import = 'plugins.ui.notifications' }, -- Notifications and UI enhancements
  { import = 'plugins.ui.windows' },       -- Window management
}
