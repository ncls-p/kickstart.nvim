-- Plugin management and configuration
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with our configuration
require('lazy').setup({
  -- Import all the different plugin categories
  { import = 'plugins.core' },    -- Core functionality plugins
  { import = 'plugins.ui' },      -- UI and appearance (imports from plugins.ui.init)
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
