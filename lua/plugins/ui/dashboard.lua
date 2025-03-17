-- Dashboard configuration
return {
  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local db = require 'dashboard'

      db.setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            { desc = '🔍 Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
            { desc = '🧩 Apps', group = 'DiagnosticHint', action = 'Telescope app', key = 'a' },
            { desc = '🕒 Recent', group = 'Number', action = 'Telescope oldfiles', key = 'r' },
            { desc = '🔎 Search', group = 'Function', action = 'Telescope live_grep', key = 't' },
            { desc = '⚙️ Config', group = 'String', action = 'e $MYVIMRC', key = 'c' },
            { desc = '🚪 Exit', group = 'Error', action = 'qa', key = 'q' },
          },
          project = { enable = true, limit = 8, icon = ' ', label = 'Recent Projects', action = 'Telescope find_files cwd=' },
          mru = { limit = 10, icon = ' ', label = 'Recent Files' },
          footer = {
            '',
            'NCLS Neovim - Modern and Professional',
          },
        },
      }
    end,
  },
}
