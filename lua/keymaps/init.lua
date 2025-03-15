-- Keymaps configuration
local map = vim.keymap.set

-- Helper function for better mapping
local function keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  map(mode, lhs, rhs, opts)
end

-- Clear search highlighting with Escape
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighting' })

-- Modern keybindings section
-- Navigation
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Find in files (grep)' })
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Find help' })
keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find recent files' })
keymap('n', '<leader>fc', '<cmd>Telescope commands<CR>', { desc = 'Find commands' })
keymap('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find TODOs' })

-- File explorer (Neo-tree)
keymap('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })
keymap('n', '<leader>o', '<cmd>Neotree focus<CR>', { desc = 'Focus file explorer' })

-- Code actions and navigation
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
keymap('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format code' })
keymap('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
keymap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover documentation' })

-- VSCode-like keybindings
keymap('n', '<D-p>', '<cmd>Telescope find_files<CR>', { desc = 'Find files (VSCode: Cmd+P)' })
keymap('i', '<D-p>', '<Esc><cmd>Telescope find_files<CR>', { desc = 'Find files (VSCode: Cmd+P)' })
keymap('n', '<D-F>', '<cmd>Telescope live_grep<CR>', { desc = 'Find in files (VSCode: Cmd+Shift+F)' })
keymap('i', '<D-F>', '<Esc><cmd>Telescope live_grep<CR>', { desc = 'Find in files (VSCode: Cmd+Shift+F)' })
keymap('n', '<D-P>', '<cmd>Telescope commands<CR>', { desc = 'Command palette (VSCode: Cmd+Shift+P)' })
keymap('i', '<D-P>', '<Esc><cmd>Telescope commands<CR>', { desc = 'Command palette (VSCode: Cmd+Shift+P)' })
keymap('n', '<D-s>', '<cmd>w<CR>', { desc = 'Save file (VSCode: Cmd+S)' })
keymap('i', '<D-s>', '<Esc><cmd>w<CR>a', { desc = 'Save file (VSCode: Cmd+S)' })
keymap('n', '<D-w>', '<cmd>bdelete<CR>', { desc = 'Close buffer (VSCode: Cmd+W)' })
keymap('i', '<D-w>', '<Esc><cmd>bdelete<CR>', { desc = 'Close buffer (VSCode: Cmd+W)' })
keymap('n', '<D-o>', '<cmd>Telescope find_files<CR>', { desc = 'Open file (VSCode: Cmd+O)' })
keymap('i', '<D-o>', '<Esc><cmd>Telescope find_files<CR>', { desc = 'Open file (VSCode: Cmd+O)' })
keymap('n', '<D-b>', '<cmd>Neotree toggle<CR>', { desc = 'Toggle sidebar (VSCode: Cmd+B)' })
keymap('i', '<D-b>', '<Esc><cmd>Neotree toggle<CR>', { desc = 'Toggle sidebar (VSCode: Cmd+B)' })

-- Toggle comment (requires Comment.nvim plugin)
keymap('n', '<D-/>', 'gcc', { desc = 'Toggle comment (VSCode: Cmd+/)', remap = true })
keymap('v', '<D-/>', 'gc', { desc = 'Toggle comment (VSCode: Cmd+/)', remap = true })
keymap('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
keymap('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })

-- Diagnostic navigation
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic message' })

-- Terminal
keymap('n', '<leader>tt', '<cmd>terminal<CR>', { desc = 'Open terminal' })
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window splitting
keymap('n', '<leader>ws', '<cmd>split<CR>', { desc = 'Split window horizontally' })
keymap('n', '<leader>wv', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
keymap('n', '<leader>wq', '<cmd>q<CR>', { desc = 'Close window' })

-- Resize windows
keymap('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer management with BufferLine
keymap('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', { desc = 'Close selected buffer' })
keymap('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
keymap('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })

-- Tab management
keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'New tab' })
keymap('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })
keymap('n', '<leader>to', '<cmd>tabonly<CR>', { desc = 'Close other tabs' })
keymap('n', '<S-l>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
keymap('n', '<S-h>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- Move lines up and down
keymap('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Better indenting
keymap('v', '<', '<gv', { desc = 'Decrease indent and stay in visual mode' })
keymap('v', '>', '>gv', { desc = 'Increase indent and stay in visual mode' })

-- Quick save
keymap('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
keymap('i', '<C-s>', '<Esc><cmd>w<CR>a', { desc = 'Save file' })

-- Quick quit
keymap('n', '<leader>qq', '<cmd>q<CR>', { desc = 'Quit' })
keymap('n', '<leader>qa', '<cmd>qa<CR>', { desc = 'Quit all' })
keymap('n', '<leader>wq', '<cmd>wq<CR>', { desc = 'Write and quit' })

-- Source current file
keymap('n', '<leader>so', '<cmd>source %<CR>', { desc = 'Source current file' })

-- UI toggles
keymap('n', '<leader>uf', '<cmd>Telescope filetypes<CR>', { desc = 'Change filetype' })
keymap('n', '<leader>uz', function() vim.cmd('ZenMode') end, { desc = 'Toggle zen mode' })
keymap('n', '<leader>ut', function() require('trouble').toggle() end, { desc = 'Toggle trouble' })
keymap('n', '<leader>us', function() vim.o.spell = not vim.o.spell end, { desc = 'Toggle spellcheck' })
keymap('n', '<leader>uw', function() vim.o.wrap = not vim.o.wrap end, { desc = 'Toggle word wrap' })
keymap('n', '<leader>ul', '<cmd>set list!<CR>', { desc = 'Toggle invisible characters' })
keymap('n', '<leader>mm', '<cmd>CodewindowToggle<CR>', { desc = 'Toggle minimap' })

-- Return the module
return {
  keymap = keymap,
  setup_vscode_keys = function()
    require('keymaps.vscode').setup()
  end,
}
