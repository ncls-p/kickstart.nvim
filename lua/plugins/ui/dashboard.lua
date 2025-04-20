-- Dashboard configuration
return {
  -- Dashboard with simplified menu
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local db = require 'dashboard'

      db.setup {
        theme = 'hyper',
        config = {
          week_header = { enable = false },
          shortcut = {
            -- Only most essential shortcuts
            { desc = 'Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
            { desc = 'Recent', group = 'Number', action = 'Telescope oldfiles', key = 'r' },
            { desc = 'Search', group = 'Function', action = 'Telescope live_grep', key = 's' },
            { desc = 'Config', group = 'String', action = 'e $MYVIMRC', key = 'c' },
            { desc = 'Exit', group = 'Error', action = 'qa', key = 'q' },
          },
          project = { enable = true, limit = 5, action = 'Telescope find_files cwd=' },
          mru = { limit = 5 },
          footer = { 'Neovim' },
        },
      }
    end,
  },
}
