return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  ft = { "scala", "sbt", "java" },
  config = function()
    local metals_config = require("metals").bare_config()
    
    -- Configure metals
    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = {
        "akka.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl",
      },
      serverVersion = "latest.snapshot",
    }
    
    -- Debug settings
    metals_config.init_options.statusBarProvider = "on"
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- Metals commands
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
        
        -- Metals specific mappings
        vim.keymap.set("n", "<leader>mc", require("metals").commands, { buffer = true, desc = "Metals Commands" })
        vim.keymap.set("n", "<leader>mt", require("metals").toggle_setting, { buffer = true, desc = "Toggle Metals Setting" })
        
        -- LSP mappings (complementing the existing ones)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to Definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true, desc = "Go to Implementation" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true, desc = "Go to References" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Hover Documentation" })
      end,
      group = nvim_metals_group,
    })
  end,
}
