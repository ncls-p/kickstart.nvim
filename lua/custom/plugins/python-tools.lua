return {
  -- Python tools and utilities
  {
    "nvim-lua/plenary.nvim",
    dependencies = {},
    config = function()
      -- Initialize Python utilities
      require("custom.python").setup()
      
      -- Python-specific keymaps
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          -- Run current file
          vim.keymap.set("n", "<leader>pr", "<cmd>!python %<CR>", { buffer = true, desc = "🐍 [P]ython [R]un file" })
          
          -- Run pytest on current file
          vim.keymap.set("n", "<leader>pt", "<cmd>!pytest %<CR>", { buffer = true, desc = "🧪 [P]ython [T]est file" })
          
          -- Run pytest on current function
          vim.keymap.set("n", "<leader>pf", "<cmd>!pytest % -xvs<CR>", { buffer = true, desc = "🔬 [P]ython test [F]unction" })
          
          -- Toggle virtual environment
          vim.keymap.set("n", "<leader>pv", function()
            require("custom.python").select_python_interpreter()
          end, { buffer = true, desc = "🔄 [P]ython select [V]irtual env" })
          
          -- Install package
          vim.keymap.set("n", "<leader>pi", function()
            vim.ui.input({ prompt = "Package to install: " }, function(input)
              if input then
                vim.cmd("!pip install " .. input)
              end
            end)
          end, { buffer = true, desc = "📦 [P]ython [I]nstall package" })
          
          -- Generate docstring
          vim.keymap.set("n", "<leader>pd", function()
            -- This would ideally use a docstring generator like pydocstring
            vim.notify("Generating docstring...", vim.log.levels.INFO)
            -- Placeholder for actual implementation
          end, { buffer = true, desc = "📝 [P]ython generate [D]ocstring" })
        end,
      })
    end,
  }
}
