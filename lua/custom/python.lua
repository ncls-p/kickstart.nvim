local M = {}

-- Store the current Python interpreter path
M.current_python = vim.fn.exepath('python3') or vim.fn.exepath('python')

-- Function to set Python interpreter for the current session
function M.set_python_path(path)
  -- Validate the path exists
  if vim.fn.executable(path) ~= 1 then
    vim.notify("Python interpreter not found at: " .. path, vim.log.levels.ERROR)
    return false
  end
  
  -- Update the current Python path
  M.current_python = path
  
  -- Update Pyright configuration
  if vim.lsp.get_clients({ name = "pyright" })[1] then
    for _, client in ipairs(vim.lsp.get_clients({ name = "pyright" })) do
      client.config.settings.python.pythonPath = path
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    vim.notify("Python interpreter set to: " .. path, vim.log.levels.INFO)
  else
    vim.notify("Python interpreter set to: " .. path .. " (LSP not running)", vim.log.levels.INFO)
  end
  
  return true
end

-- Function to select Python interpreter from a menu
function M.select_python_interpreter()
  -- Common locations to check for Python interpreters
  local locations = {
    vim.fn.expand("~/.pyenv/versions/*/bin/python"),
    vim.fn.expand("~/.virtualenvs/*/bin/python"),
    vim.fn.expand("~/venv/*/bin/python"),
    vim.fn.expand("~/*/venv/bin/python"),
    vim.fn.expand("~/.conda/envs/*/bin/python"),
    vim.fn.expand("~/miniconda3/envs/*/bin/python"),
    vim.fn.expand("~/anaconda3/envs/*/bin/python"),
    "/usr/bin/python3",
    "/usr/local/bin/python3",
  }
  
  -- Collect all Python interpreters
  local interpreters = {}
  for _, pattern in ipairs(locations) do
    for _, path in ipairs(vim.fn.glob(pattern, false, true)) do
      if vim.fn.executable(path) == 1 then
        table.insert(interpreters, path)
      end
    end
  end
  
  -- Add current project virtualenv if it exists
  local project_venv = vim.fn.getcwd() .. "/venv/bin/python"
  if vim.fn.executable(project_venv) == 1 then
    table.insert(interpreters, 1, project_venv) -- Add at the beginning
  end
  
  -- Add system Python
  local system_python = vim.fn.exepath('python3') or vim.fn.exepath('python')
  if system_python and vim.fn.executable(system_python) == 1 then
    table.insert(interpreters, system_python)
  end
  
  -- Remove duplicates
  local unique_interpreters = {}
  local seen = {}
  for _, path in ipairs(interpreters) do
    if not seen[path] then
      seen[path] = true
      table.insert(unique_interpreters, path)
    end
  end
  
  -- If no interpreters found
  if #unique_interpreters == 0 then
    vim.notify("No Python interpreters found", vim.log.levels.ERROR)
    return
  end
  
  -- Show selection menu
  vim.ui.select(unique_interpreters, {
    prompt = "Select Python Interpreter:",
    format_item = function(path)
      -- Get Python version
      local version = vim.fn.system(path .. " --version")
      version = version:match("Python ([%d%.]+)")
      version = version or "Unknown version"
      
      -- Get environment name (if in virtualenv)
      local env_name = path:match(".+/(.+)/bin/python$") or "System"
      
      -- Format display string
      return env_name .. " (" .. version .. "): " .. path
    end,
  }, function(choice)
    if choice then
      M.set_python_path(choice)
    end
  end)
end

-- Set up keymaps
function M.setup()
  vim.api.nvim_create_user_command("PythonSelectInterpreter", M.select_python_interpreter, {})
  
  -- Add keymap for quick access
  vim.keymap.set("n", "<leader>ps", M.select_python_interpreter, { desc = "[P]ython [S]elect Interpreter" })
end

return M
