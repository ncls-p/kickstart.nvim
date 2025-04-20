-- LSP configuration and setup
-- This file now imports from the modular LSP components
return {
  -- Import all modular LSP components
  require('plugins.lsp.core'),        -- Core LSP setup and keybindings
  require('plugins.lsp.servers'),     -- Language server configurations
  require('plugins.lsp.completion'),  -- Autocompletion
  require('plugins.lsp.formatting'),  -- Code formatting
}

