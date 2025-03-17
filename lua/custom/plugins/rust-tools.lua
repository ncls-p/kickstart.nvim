return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  ft = { "rust" },
  config = function()
    local rt = require("rust-tools")
    
    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "ℹ️ Rust Hover Actions" })
          -- Code action groups
          vim.keymap.set("n", "<leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr, desc = "🔧 Rust Code Actions" })
          -- Run
          vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "🏃 Rust Runnables" })
          -- Expand macro
          vim.keymap.set("n", "<leader>rm", rt.expand_macro.expand_macro, { buffer = bufnr, desc = "🔍 Expand Rust Macro" })
          -- Open Cargo.toml
          vim.keymap.set("n", "<leader>rc", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr, desc = "📦 Open Cargo.toml" })
          -- Parent module
          vim.keymap.set("n", "<leader>rp", rt.parent_module.parent_module, { buffer = bufnr, desc = "⬆️ Go to Parent Module" })
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
      tools = {
        inlay_hints = {
          auto = true,
          show_parameter_hints = true,
        },
        hover_actions = {
          auto_focus = true,
        },
      },
    })
  end,
}
