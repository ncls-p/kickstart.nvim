-- LSP core configuration
return {
  -- LSP Development
  { 'folke/lazydev.nvim', ft = 'lua' },
  -- Linting (inline diagnostics)
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' }, -- Trigger early
    config = function()
      local lint = require('lint')

      -- Configure linters per filetype
      lint.linters_by_ft = {
        -- Add linters for specific filetypes here, e.g.:
        -- javascript = { 'eslint_d' },
        -- python = { 'ruff' },
        -- lua = { 'luacheck' },
      }

      -- Autocommand to run linting
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },


  -- Core LSP setup
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- LSP attach handler
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          -- Simplified LSP keymaps - only keeping the most essential ones
          map('gd', vim.lsp.buf.definition, 'Go to Definition')
          map('gr', require('telescope.builtin').lsp_references, 'Go to References')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>r', vim.lsp.buf.rename, 'Rename')
          map('<leader>a', vim.lsp.buf.code_action, 'Code Action', { 'n', 'v' })
          map('<leader>f', vim.lsp.buf.format, 'Format')
          map('<leader>s', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        end,
      })

      -- Simplified diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = 'H',
          },
        },
      }
    end,
  },
}
