-- UI themes and colorschemes
return {
  -- Themes
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
          percentage = 0.15,
        },
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          bufferline = true,
          indent_blankline = { enabled = true },
          mini = true,
          navic = true,
          mason = true,
          noice = true,
          notify = true,
          lsp_trouble = true,
        },
      }
      -- Set colorscheme after setup
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- Additional themes
  { 'folke/tokyonight.nvim', lazy = true, priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = true, priority = 1000 },
  { 'EdenEast/nightfox.nvim', lazy = true, priority = 1000 },
  { 'rebelot/kanagawa.nvim', lazy = true, priority = 1000 },

  -- Theme manager
  {
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup {
        -- List of themes to use
        themes = {
          {
            name = 'Catppuccin Mocha',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "mocha"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Mocha (Transparent)',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "mocha"
              require("catppuccin").setup({
                transparent_background = true
              })
            ]],
          },
          {
            name = 'Catppuccin Macchiato',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "macchiato"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Frappe',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "frappe"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Latte',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "latte"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Tokyo Night',
            colorscheme = 'tokyonight',
          },
          {
            name = 'Tokyo Night Storm',
            colorscheme = 'tokyonight-storm',
          },
          {
            name = 'Tokyo Night Day',
            colorscheme = 'tokyonight-day',
          },
          {
            name = 'Rose Pine',
            colorscheme = 'rose-pine',
          },
          {
            name = 'Rose Pine Moon',
            colorscheme = 'rose-pine-moon',
          },
          {
            name = 'Rose Pine Dawn',
            colorscheme = 'rose-pine-dawn',
          },
          {
            name = 'Nightfox',
            colorscheme = 'nightfox',
          },
          {
            name = 'Duskfox',
            colorscheme = 'duskfox',
          },
          {
            name = 'Kanagawa',
            colorscheme = 'kanagawa',
          },
        },
        livePreview = true,
      }

      -- Add keymap to open Themery
      vim.keymap.set('n', '<leader>ts', '<cmd>Themery<CR>', { desc = '🎨 [T]heme [S]elector' })
    end,
  },
}
