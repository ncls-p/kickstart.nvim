-- VSCode-like keybindings
local M = {}

function M.setup()
  local keymap = vim.keymap.set
  
  -- Additional VSCode-like keybindings
  
  -- CMD+D = Select next occurrence (requires vim-visual-multi)
  keymap('n', '<D-d>', '<Plug>(VM-Find-Under)', { desc = 'Select next occurrence (VSCode: Cmd+D)' })
  
  -- CMD+SHIFT+L = Select all occurrences (requires vim-visual-multi)
  keymap('n', '<D-L>', '<Plug>(VM-Select-All)', { desc = 'Select all occurrences (VSCode: Cmd+Shift+L)' })
  
  -- F2 = Rename symbol
  keymap('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename symbol (VSCode: F2)' })
  
  -- F12 = Go to definition
  keymap('n', '<F12>', vim.lsp.buf.definition, { desc = 'Go to definition (VSCode: F12)' })
  
  -- SHIFT+F12 = Go to references
  keymap('n', '<S-F12>', function() require('telescope.builtin').lsp_references() end, { desc = 'Go to references (VSCode: Shift+F12)' })
  
  -- CTRL+SPACE = Trigger completion
  keymap('i', '<C-Space>', function() require('cmp').complete() end, { desc = 'Trigger completion (VSCode: Ctrl+Space)' })
  
  -- CTRL+` = Toggle terminal
  keymap('n', '<C-`>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal (VSCode: Ctrl+`)' })
  keymap('t', '<C-`>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal (VSCode: Ctrl+`)' })
  
  -- CTRL+TAB = Next buffer
  keymap('n', '<C-Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer (VSCode: Ctrl+Tab)' })
  keymap('i', '<C-Tab>', '<Esc><cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer (VSCode: Ctrl+Tab)' })
  
  -- CTRL+SHIFT+TAB = Previous buffer
  keymap('n', '<C-S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer (VSCode: Ctrl+Shift+Tab)' })
  keymap('i', '<C-S-Tab>', '<Esc><cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer (VSCode: Ctrl+Shift+Tab)' })
  
  -- ALT+UP/DOWN = Move line up/down (already defined in main keymaps)
  
  -- CTRL+G = Go to line
  keymap('n', '<C-g>', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Go to line (VSCode: Ctrl+G)' })
  
  -- CTRL+P = Quick open (already defined with CMD+P)
  keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', { desc = 'Quick open (VSCode: Ctrl+P)' })
  
  -- CTRL+SHIFT+E = Explorer
  keymap('n', '<C-S-e>', '<cmd>Neotree toggle<CR>', { desc = 'Explorer (VSCode: Ctrl+Shift+E)' })
  
  -- CTRL+SHIFT+F = Find in files (already defined with CMD+SHIFT+F)
  keymap('n', '<C-S-f>', '<cmd>Telescope live_grep<CR>', { desc = 'Find in files (VSCode: Ctrl+Shift+F)' })
  
  -- CTRL+, = Open settings
  keymap('n', '<C-,>', '<cmd>e $MYVIMRC<CR>', { desc = 'Open settings (VSCode: Ctrl+,)' })
  
  -- CTRL+\ = Split editor
  keymap('n', '<C-\\>', '<cmd>vsplit<CR>', { desc = 'Split editor right (VSCode: Ctrl+\\)' })
  
  -- F1 = Show command palette
  keymap('n', '<F1>', '<cmd>Telescope commands<CR>', { desc = 'Show command palette (VSCode: F1)' })
  
  -- CTRL+SHIFT+P = Show command palette
  keymap('n', '<C-S-p>', '<cmd>Telescope commands<CR>', { desc = 'Show command palette (VSCode: Ctrl+Shift+P)' })
  
  -- CTRL+= / CTRL+- = Zoom in/out
  keymap('n', '<C-=>', '<cmd>lua vim.o.guifont = string.gsub(vim.o.guifont, "%d+", function(n) return tonumber(n) + 1 end)<CR>', 
    { desc = 'Zoom in (VSCode: Ctrl+=)' })
  keymap('n', '<C-->', '<cmd>lua vim.o.guifont = string.gsub(vim.o.guifont, "%d+", function(n) return math.max(1, tonumber(n) - 1) end)<CR>',
    { desc = 'Zoom out (VSCode: Ctrl+-)' })

  -- CTRL+K Z = Zen mode toggle (Removed)
  -- keymap('n', '<C-k><C-z>', '<cmd>ZenMode<CR>', { desc = 'Toggle zen mode (VSCode: Ctrl+K Z)' })
end

return M
