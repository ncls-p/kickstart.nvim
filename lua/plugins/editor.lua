-- Editor tools and utilities
-- This file now imports from the modular editor components
return {
  -- Import all modular editor components
  require('plugins.editor.git'),         -- Git integration
  require('plugins.editor.telescope'),   -- Fuzzy finder
  require('plugins.editor.terminal'),    -- Terminal integration  
  require('plugins.editor.todo'),        -- Todo comments
  require('plugins.editor.treesitter'),  -- Syntax highlighting and code analysis
  require('plugins.editor.explorer'),    -- File explorer
}
