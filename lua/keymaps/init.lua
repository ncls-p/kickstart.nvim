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

-- VSCode-like keybindings
-- CMD+P = Find files (Telescope)
keymap('n', '<D-p>', '<cmd>Telescope find_files<CR>', { desc = 'Find files (VSCode: Cmd+P)' })
keymap('i', '<D-p>', '<Esc><cmd>Telescope find_files<CR>', { desc = 'Find files (VSCode: Cmd+P)' })

-- CMD+SHIFT+F = Find in files (Telescope grep)
keymap('n', '<D-F>', '<cmd>Telescope live_grep<CR>', { desc = 'Find in files (VSCode: Cmd+Shift+F)' })
keymap('i', '<D-F>', '<Esc><cmd>Telescope live_grep<CR>', { desc = 'Find in files (VSCode: Cmd+Shift+F)' })

-- CMD+SHIFT+P = Command palette
keymap('n', '<D-P>', '<cmd>Telescope commands<CR>', { desc = 'Command palette (VSCode: Cmd+Shift+P)' })
keymap('i', '<D-P>', '<Esc><cmd>Telescope commands<CR>', { desc = 'Command palette (VSCode: Cmd+Shift+P)' })

-- CMD+/ = Toggle comment
keymap('n', '<D-/>', '<Plug>(comment_toggle_linewise_current)', { desc = 'Toggle comment (VSCode: Cmd+/)' })
keymap('v', '<D-/>', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle comment (VSCode: Cmd+/)' })

-- CMD+S = Save
keymap('n', '<D-s>', '<cmd>w<CR>', { desc = 'Save file (VSCode: Cmd+S)' })
keymap('i', '<D-s>', '<Esc><cmd>w<CR>a', { desc = 'Save file (VSCode: Cmd+S)' })

-- CMD+W = Close buffer
keymap('n', '<D-w>', '<cmd>bdelete<CR>', { desc = 'Close buffer (VSCode: Cmd+W)' })
keymap('i', '<D-w>', '<Esc><cmd>bdelete<CR>', { desc = 'Close buffer (VSCode: Cmd+W)' })

-- CMD+O = Open file
keymap('n', '<D-o>', '<cmd>Telescope find_files<CR>', { desc = 'Open file (VSCode: Cmd+O)' })
keymap('i', '<D-o>', '<Esc><cmd>Telescope find_files<CR>', { desc = 'Open file (VSCode: Cmd+O)' })

-- CMD+B = Toggle sidebar (NvimTree)
keymap('n', '<D-b>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle sidebar (VSCode: Cmd+B)' })
keymap('i', '<D-b>', '<Esc><cmd>NvimTreeToggle<CR>', { desc = 'Toggle sidebar (VSCode: Cmd+B)' })

-- Diagnostic navigation
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation (works well with AZERTY keyboards)
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize windows
keymap('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer management (classic style)
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
keymap('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
keymap('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })
keymap('n', '<leader>bl', '<cmd>buffers<CR>', { desc = '[B]uffer [L]ist' })

-- Tab management
keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = '[T]ab [N]ew' })
keymap('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
keymap('n', '<leader>to', '<cmd>tabonly<CR>', { desc = '[T]ab [O]nly' })
keymap('n', '<leader>tl', '<cmd>tabs<CR>', { desc = '[T]ab [L]ist' })
keymap('n', '<S-l>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
keymap('n', '<S-h>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- Move lines up and down (works in normal and visual mode)
keymap('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Stay in indent mode when indenting in visual mode
keymap('v', '<', '<gv', { desc = 'Decrease indent and stay in visual mode' })
keymap('v', '>', '>gv', { desc = 'Increase indent and stay in visual mode' })

-- Save file with Ctrl+S (works in normal and insert mode)
keymap('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
keymap('i', '<C-s>', '<Esc><cmd>w<CR>a', { desc = 'Save file' })

-- Quit
keymap('n', '<leader>qq', '<cmd>q<CR>', { desc = '[Q]uit' })
keymap('n', '<leader>qa', '<cmd>qa<CR>', { desc = '[Q]uit [A]ll' })
keymap('n', '<leader>wq', '<cmd>wq<CR>', { desc = '[W]rite and [Q]uit' })

-- File explorer (netrw)
keymap('n', '<leader>fe', '<cmd>Explore<CR>', { desc = '[F]ile [E]xplorer' })

-- Source current file
keymap('n', '<leader>so', '<cmd>source %<CR>', { desc = '[S]ource current file' })

-- Telescope specific keymaps are defined in the telescope plugin config

-- Return the module
return {
  keymap = keymap,
  setup_vscode_keys = function()
    require('keymaps.vscode').setup()
  end,
}
