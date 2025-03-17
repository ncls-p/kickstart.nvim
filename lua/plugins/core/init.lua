-- Core plugins initialization
-- This file imports all core plugin modules

return {
  -- Import all core modules
  { import = 'plugins.core.keybindings' }, -- Keybinding-related plugins
  { import = 'plugins.core.editing' },     -- Core editing plugins
  { import = 'plugins.core.buffers' },     -- Buffer management plugins
}
