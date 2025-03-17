-- LSP plugins initialization
-- This file imports all LSP-related plugin modules

return {
  -- Import all LSP modules
  { import = 'plugins.lsp.core' },       -- Core LSP configuration
  { import = 'plugins.lsp.servers' },    -- LSP server configurations
  { import = 'plugins.lsp.completion' }, -- Autocompletion
  { import = 'plugins.lsp.formatting' }, -- Formatting
}
