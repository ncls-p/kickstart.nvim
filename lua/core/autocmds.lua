-- Autocommands configuration
local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup,
  callback = function() vim.highlight.on_yank() end,
})

-- Auto-resize splits when Neovim is resized
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto-resize splits on window resize',
  group = augroup,
  callback = function() vim.cmd('wincmd =') end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Return to last edit position when opening files',
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with just q
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close some filetypes with just q',
  group = augroup,
  pattern = {
    'help',
    'man',
    'qf',
    'checkhealth',
    'lspinfo',
    'startuptime',
    'TelescopePrompt',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Auto-create directories when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Auto-create directories when saving a file',
  group = augroup,
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Wrap and check for spell in text filetypes',
  group = augroup,
  pattern = { 'gitcommit', 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
