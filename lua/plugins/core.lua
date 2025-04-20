-- Core plugins - imports modular components
return {
  require('plugins.core.sleuth'),        -- Automatic indentation detection
  require('plugins.core.which-key'),     -- Keybinding hints
  require('plugins.core.bufferline'),    -- Buffer line management
  require('plugins.core.mini'),          -- Mini plugins collection
  require('plugins.core.visual-multi'),  -- Multi-cursor support
  require('plugins.core.neoscroll'),     -- Smooth scrolling
}
