-- Treesitter configuration
return {
  -- Treesitter with simplified configuration
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Simplified list of core languages
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'lua',
          'markdown',
          'vim',
          'javascript',
          'typescript',
          'python',
          'html',
          'css',
          'json',
          'yaml',
          'rust',
          'go',
          'dockerfile',
          'sql',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        -- Simplified incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            node_decremental = '<M-space>',
          },
        },
        -- Simplified textobjects
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
        },
      }
    end,
  },
}
