return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function() vim.fn["mkdp#util#install"]() end,
  ft = { "markdown" },
  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_browser = ""
    vim.g.mkdp_echo_preview_url = 0
    vim.g.mkdp_page_title = '「${name}」'
    
    -- Markdown keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { buffer = true, desc = "Toggle [M]arkdown [P]review" })
      end,
    })
  end,
}
