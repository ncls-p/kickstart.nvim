-- Keybinding-related plugins
return {
  -- Which-key for keybinding help
  { 
    'folke/which-key.nvim', 
    event = 'VimEnter', 
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = { enabled = true, suggestions = 20 },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        win = {  -- Renamed from 'window' to 'win'
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "center",
        },
        show_help = true,
      })
      
      -- Register key groups with descriptive titles (using newer spec format)
      wk.register({
        { "<leader>b", group = "󰖯 Buffer" },
        { "<leader>c", group = " Code" },
        { "<leader>d", group = " Debug" },
        { "<leader>f", group = "󰍉 Find/Files" },
        { "<leader>g", group = " Git" },
        { "<leader>l", group = " LSP" },
        { "<leader>s", group = "󰛔 Search" },
        { "<leader>t", group = " Terminal" },
        { "<leader>u", group = " UI/Settings" },
        { "<leader>w", group = "󱂬 Window" },
      })
    end
  },
}
