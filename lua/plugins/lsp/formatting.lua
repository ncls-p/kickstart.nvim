-- Formatting configuration
return {
  -- Formatting with simplified options
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        desc = 'Format buffer',
      },
    },
    opts = {
      -- Simplified formatters configuration
      formatters_by_ft = {
        -- Web development
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        
        -- Core languages
        lua = { 'stylua' },
        python = { 'black' },
        rust = { 'rustfmt' },
        go = { 'goimports' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
      },
      -- Basic format on save
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
  },
}
