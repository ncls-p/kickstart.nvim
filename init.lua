-- Neovim Configuration
---------------------------------------------------------------
-- A clean, modular, and easy-to-maintain Neovim configuration
---------------------------------------------------------------

-- Bootstrap the configuration
local bootstrap = function()
  -- Set leader key before anything else
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ','

  -- Detect if NerdFonts are available
  vim.g.have_nerd_font = true

  -- Bootstrap lazy.nvim (plugin manager)
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  end
  vim.opt.rtp:prepend(lazypath)
end

-- Initialize the environment
bootstrap()

-- Load core settings (options, autocmds)
require 'core'

-- Load keymaps
require 'keymaps'

-- Load plugins
require 'plugins'

-- Load language-specific settings and custom configs
require 'config'
