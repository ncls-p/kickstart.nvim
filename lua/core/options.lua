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
opt.showmode = false       -- Mode is shown in the statusline instead
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.termguicolors = true
opt.laststatus = 3        -- Global statusline
opt.cmdheight = 0         -- Hide command line when not in use for cleaner UI
opt.pumheight = 10        -- Maximum number of items to show in the popup menu
opt.winblend = 10         -- Slight transparency for floating windows
opt.pumblend = 10         -- Slight transparency for popup menu
opt.title = true          -- Set window title
opt.titlestring = "%f - NVIM" -- Show filename in title
opt.synmaxcol = 240       -- Only highlight the first 240 columns

-- Editor Behavior
opt.clipboard = 'unnamedplus'
opt.breakindent = true
opt.undofile = true
opt.undolevels = 10000
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 200      -- Faster updates for better UX
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
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Font for GUI
g.have_nerd_font = true

-- Netrw (built-in file explorer) - less relevant with Neo-tree
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 0

-- Cursor settings
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- Different cursor shapes based on mode

-- Performance
opt.redrawtime = 1500
opt.ttyfast = true
opt.lazyredraw = true

-- NOTE: The colorscheme should be set in the plugin config after lazy.nvim loads
-- Moved from here to prevent the E185 error

-- Disable automatic commenting on newline
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- Remember cursor position
vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- Highlight on yank
vim.cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
  augroup END
]]
