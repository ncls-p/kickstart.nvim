-- File explorer
return {
  -- File explorer using Neo-tree
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
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
          position = 'left',
          width = 30,
          mappings = {
            -- Simplify mappings to bare essentials
            ['<space>'] = 'none',
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['.'] = 'toggle_hidden',
            ['<c-x>'] = 'open_split',
            ['<c-v>'] = 'open_vsplit',
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
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
        default_component_configs = {
          indent = { with_expanders = true },
          icon = {
            folder_closed = "📁",
            folder_open = "📂",
            default = "📄",
          },
          git_status = {
            symbols = {
              added = "+",
              modified = "~",
              deleted = "-",
              renamed = "→",
              untracked = "?",
            },
          },
        },
      }
      -- Simple keymaps for file explorer
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Explorer' })
      vim.keymap.set('n', '<C-b>', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Explorer' })
    end,
  },
}
