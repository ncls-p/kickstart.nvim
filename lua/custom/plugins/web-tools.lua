return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "xml", "jsx", "tsx", "vue", "svelte", "php", "markdown" },
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html", "xml", "jsx", "tsx", "vue", "svelte", "php", "markdown",
          "javascript", "typescript", "javascriptreact", "typescriptreact"
        },
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "html", "css", "scss", "javascript", "typescript", "vue", "svelte" },
    config = function()
      require("colorizer").setup({
        "html", "css", "scss", "javascript", "typescript", "vue", "svelte",
      }, {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "javascript", "typescript", "jsx", "tsx", "vue", "svelte", "php" },
    init = function()
      -- Enable emmet for specific filetypes
      vim.g.user_emmet_install_global = 0
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "html", "css", "scss", "javascript", "typescript", "jsx", "tsx", "vue", "svelte", "php" },
        callback = function()
          vim.cmd("EmmetInstall")
          -- Set emmet leader key to <C-y>
          vim.g.user_emmet_leader_key = "<C-y>"
        end,
      })
    end,
  },
}
