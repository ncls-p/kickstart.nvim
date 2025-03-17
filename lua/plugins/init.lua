-- Plugin management and configuration
-- This module sets up lazy.nvim and loads all plugin specifications

-- Setup lazy.nvim with our configuration
require('lazy').setup({
  -- Import all the different plugin categories
  { import = 'plugins.core' },    -- Core functionality plugins
  { import = 'plugins.ui' },      -- UI and appearance plugins
  { import = 'plugins.lsp' },     -- LSP, completion, and formatting
  { import = 'plugins.editor' },  -- Editor tools (telescope, nvim-tree, etc.)
  
  -- Import custom language-specific plugins
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      plugin = '🔌',
    },
    border = 'rounded',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
