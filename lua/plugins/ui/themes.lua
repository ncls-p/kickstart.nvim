-- Theme-related UI components
return {
  -- VSCode Dark+ Theme
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      -- Load the theme
      vim.cmd.colorscheme 'vscode'
    end,
  },

  -- Main theme
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
      -- vim.cmd.colorscheme 'catppuccin' -- Disabled to allow vscode theme to take precedence
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
        -- Reduced list of essential themes
        themes = {
          {
            name = 'Catppuccin Dark',
            colorscheme = 'catppuccin',
            before = [[
              vim.g.catppuccin_flavour = "mocha"
              require("catppuccin").setup({
                transparent_background = false
              })
            ]],
          },
          {
            name = 'Catppuccin Light',
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
            name = 'Kanagawa',
            colorscheme = 'kanagawa',
          },
        },
        livePreview = true,
      }

      vim.keymap.set('n', '<leader>t', '<cmd>Themery<CR>', { desc = 'Theme selector' })
    end,
  },
}
