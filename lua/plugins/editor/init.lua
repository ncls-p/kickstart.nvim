-- Editor plugins initialization
-- This file imports all editor-related plugin modules

return {
  -- Import all editor modules
  { import = 'plugins.editor.git' },        -- Git integration
  { import = 'plugins.editor.telescope' },  -- Fuzzy finder
  { import = 'plugins.editor.explorer' },   -- File explorer
  { import = 'plugins.editor.treesitter' }, -- Syntax highlighting and code navigation
  { import = 'plugins.editor.terminal' },   -- Terminal integration
  { import = 'plugins.editor.todo' },       -- Todo comments
}
