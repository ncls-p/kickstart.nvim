-- Core Neovim options
local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = ' '
g.maplocalleader = ' '

-- UI Options
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.mousemoveevent = true  -- Enable mouse drag events
opt.showmode = false
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.termguicolors = true
opt.laststatus = 3 -- Global statusline
opt.cmdheight = 0  -- Hide command line when not in use for cleaner UI
opt.pumheight = 10 -- Maximum number of items to show in the popup menu
opt.winblend = 10  -- Slight transparency for floating windows
opt.pumblend = 10  -- Slight transparency for popup menu

-- Editor Behavior
opt.clipboard = 'unnamedplus'
opt.breakindent = true
opt.undofile = true
opt.undolevels = 10000
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.inccommand = 'split'
opt.confirm = true
opt.wrap = false
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 0
opt.fileencoding = 'utf-8'
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Font for GUI
g.have_nerd_font = true

-- Netrw (built-in file explorer)
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 0
