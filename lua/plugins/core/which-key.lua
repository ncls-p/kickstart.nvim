-- Which-key for keybinding help
return { 
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
      -- Mappings for navigating the popup buffer (formerly popup_mappings)
      keys = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      -- Window configuration (formerly window)
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 }, -- Adjusted padding format if needed by new API, assuming it's the same
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      -- Filter function (replaces ignore_missing and hidden)
      -- Default filter usually handles hidden/missing keys, add custom logic if needed
      filter = function(mapping) return mapping.key ~= "" end, -- Example: basic filter
      show_help = true,
      -- Triggers configuration (replaces triggers="auto" and triggers_blacklist)
      triggers = {
        "<leader>", -- Default trigger (Removed mode-specific blacklists to fix errors)
      },
    })
    
    -- Register key groups with descriptive titles
    -- Register key groups using the new recommended format
    wk.register({
      { "<leader>b", group = "󰖯 Buffer" },
      { "<leader>f", group = "󰍉 Find/Files" },
      { "<leader>g", group = " Git" },
      { "<leader>l", group = " LSP" },
      { "<leader>s", group = "󰛔 Search" },
      { "<leader>t", group = " Terminal" },
      { "<leader>w", group = "󱂬 Window" },
      { "<leader>d", group = " Debug" },
      { "<leader>c", group = " Code" },
      { "<leader>u", group = " UI/Settings" },
    })
  end
}