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
        popup_mappings = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        window = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "center",
        },
        ignore_missing = false,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
        show_help = true,
        triggers = "auto",
        triggers_blacklist = {
          i = { "j", "k" },
          v = { "j", "k" },
        },
      })
      
      -- Register key groups with descriptive titles
      wk.register({
        ["<leader>b"] = { name = "󰖯 Buffer" },
        ["<leader>f"] = { name = "󰍉 Find/Files" },
        ["<leader>g"] = { name = " Git" },
        ["<leader>l"] = { name = " LSP" },
        ["<leader>s"] = { name = "󰛔 Search" },
        ["<leader>t"] = { name = " Terminal" },
        ["<leader>w"] = { name = "󱂬 Window" },
        ["<leader>d"] = { name = " Debug" },
        ["<leader>c"] = { name = " Code" },
        ["<leader>u"] = { name = " UI/Settings" },
      })
    end
  },
}
