return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- Default configuration options
    window = {
      layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
      width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
      height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
      border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      title = "Copilot Chat", -- title of chat window
    },
    -- Add any other configuration options here
  },
  -- Lazy load on command
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
  },
}
