-- Focus-related UI components
return {
  -- Zen Mode for distraction-free coding
  {
    'folke/zen-mode.nvim',
    enabled = false, -- Disabled as requested
    cmd = 'ZenMode',
    opts = {
      window = {
        width = 0.8,
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
      plugins = {
        twilight = { enabled = true },
      },
      on_open = function()
        vim.opt.laststatus = 0
      end,
      on_close = function()
        vim.opt.laststatus = 3
      end,
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
  },
  
  -- Twilight dims inactive portions of code
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.3,
        inactive = true,
      },
      context = 5,
    },
  },
}