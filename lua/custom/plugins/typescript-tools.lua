return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      -- spawn additional tsserver for big projects
      separate_diagnostic_server = true,
      -- specify the path to tsserver.js file, if nil or empty then the value from PATH is used
      tsserver_path = nil,
      -- specify the path to typescript formatter (prettier, prettierd, etc)
      formatter = "prettier",
      -- enable completion, requires nvim-cmp
      complete_function_calls = true,
      -- enable experimental features, requires nightly neovim
      experimental_features = false,
      -- jsx_close_tag options
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}
