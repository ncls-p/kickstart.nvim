return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod", "gosum", "gotmpl" },
  config = function()
    require("go").setup({
      -- Go tools configuration
      go = "go", -- Go command
      goimport = "gopls", -- Import organizer
      fillstruct = "gopls", -- Fill struct
      gofmt = "gofumpt", -- Formatter
      max_line_len = 120, -- Max line length
      tag_transform = false, -- Tag transformer
      test_dir = "", -- Test directory
      comment_placeholder = "", -- Comment placeholder
      
      -- Linters
      linters = { "revive", "golangci-lint" },
      
      -- Linter configuration
      linter_flags = { ["revive"] = {"-config", vim.fn.expand("~/.config/revive.toml")} },
      
      -- Formatter configuration
      formatter_flags = { ["goimports"] = {"-local", "github.com/org/project"} },
      
      -- Test flags
      test_flags = { "-v" },
      
      -- Test timeout
      test_timeout = "30s",
      
      -- Build tags
      build_tags = "",
      
      -- Run command customization
      run_command = "go run . -v",
      
      -- Diagnostic configuration
      diagnostic = {
        hdlr = true,
        underline = true,
        virtual_text = { space = 0, prefix = "■" },
        signs = true,
      },
    })
    
    -- Go-specific keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "gomod", "gosum", "gotmpl" },
      callback = function()
        -- Run
        vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<CR>", { buffer = true, desc = "Go Run" })
        -- Test
        vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { buffer = true, desc = "Go Test" })
        -- Test Function
        vim.keymap.set("n", "<leader>gtf", "<cmd>GoTestFunc<CR>", { buffer = true, desc = "Go Test Function" })
        -- Coverage
        vim.keymap.set("n", "<leader>gc", "<cmd>GoCoverage<CR>", { buffer = true, desc = "Go Coverage" })
        -- Alternate between implementation and test
        vim.keymap.set("n", "<leader>ga", "<cmd>GoAlt<CR>", { buffer = true, desc = "Go Alternate" })
        -- Generate interface stubs
        vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<CR>", { buffer = true, desc = "Go Implement Interface" })
        -- Add struct tags
        vim.keymap.set("n", "<leader>gst", "<cmd>GoAddTags<CR>", { buffer = true, desc = "Go Add Tags" })
      end,
    })
  end,
}
