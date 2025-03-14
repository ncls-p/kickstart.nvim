return {
  "tomlion/vim-solidity",
  ft = { "solidity" },
  config = function()
    -- Set up solidity-specific settings
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "solidity",
      callback = function()
        -- Set indentation for solidity files
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
        
        -- Add solidity-specific keymaps
        vim.keymap.set("n", "<leader>sc", "<cmd>!solc %<CR>", { buffer = true, desc = "Compile Solidity" })
        
        -- If forge is available, add forge commands
        if vim.fn.executable("forge") == 1 then
          vim.keymap.set("n", "<leader>sb", "<cmd>!forge build<CR>", { buffer = true, desc = "Forge Build" })
          vim.keymap.set("n", "<leader>st", "<cmd>!forge test<CR>", { buffer = true, desc = "Forge Test" })
        end
      end,
    })
  end,
}
