-- Telescope fuzzy finder
return {
  -- Fuzzy finder with simplified configuration
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          prompt_prefix = '> ',
          selection_caret = '> ',
          path_display = { 'truncate' },
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.5,
            },
            width = 0.8,
            height = 0.8,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
              ['<Esc>'] = require('telescope.actions').close,
            },
          },
          file_ignore_patterns = { 'node_modules', '.git/' },
        },
        extensions = {
          ['ui-select'] = function()
            return require('telescope.themes').get_dropdown()
          end,
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Simplified Telescope keymaps - only the most essential ones
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search Text' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Buffers' })
      vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = 'Recent Files' })
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search in Buffer' })
    end,
  },
}
