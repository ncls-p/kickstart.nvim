-- Custom configuration module
-- This centralizes all custom settings and language-specific configurations

local M = {}

function M.setup()
  -- Load language-specific configurations
  require('config.copilot').setup()
  
  -- You can add calls to other language-specific configurations here
  -- For example:
  -- Programming languages
  local filetypes = vim.fn.expand('~/.config/nvim/lua/custom/*.lua')
  for _, file in ipairs(vim.fn.split(filetypes, '\n')) do
    local filename = vim.fn.fnamemodify(file, ':t:r')
    if filename ~= 'init' then
      local ok, module = pcall(require, 'custom.' .. filename)
      if ok and type(module) == "table" and type(module.setup) == "function" then
        module.setup()
      end
    end
  end
end

return M
