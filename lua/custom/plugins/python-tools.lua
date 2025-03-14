return {
  "nvim-lua/plenary.nvim",
  dependencies = {},
  config = function()
    -- Initialize Python utilities
    require("custom.python").setup()
  end,
}
