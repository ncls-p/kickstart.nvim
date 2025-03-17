-- File explorer configuration
return {
  -- Better file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ['<space>'] = 'none',
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['.'] = 'toggle_hidden',
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
              '.DS_Store',
              'thumbs.db',
              'node_modules',
            },
          },
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw_behavior = 'open_current',
          use_libuv_file_watcher = true,
        },
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
          icon = {
            folder_closed = '📁',
            folder_open = '📂',
            folder_empty = '📄',
            default = '📄',
          },
          modified = {
            symbol = '✏️',
            highlight = 'NeoTreeModified',
          },
          git_status = {
            symbols = {
              added = '✅',
              modified = '📝',
              deleted = '❌',
              renamed = '🔄',
              untracked = '❓',
              ignored = '⚫',
              unstaged = '📌',
              staged = '✓',
              conflict = '⚠️',
            },
          },
        },
      }

      -- Key mappings
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = '🌲 Toggle Explorer' })
      vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<CR>', { desc = '👁️ Focus Explorer' })
    end,
  },
}
