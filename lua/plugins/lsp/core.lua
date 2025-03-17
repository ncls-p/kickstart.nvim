-- Core LSP configuration
return {
  -- LSP Development
  { 'folke/lazydev.nvim', ft = 'lua' },

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
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- LSP keymaps
          map('gd', require('telescope.builtin').lsp_definitions, '🔍 [G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '📚 [G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '⚙️ [G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '📜 [G]oto [D]eclaration')
          map('K', vim.lsp.buf.hover, 'ℹ️ Hover Documentation')
          map('<C-k>', vim.lsp.buf.signature_help, '📝 Signature Documentation')
          map('<leader>rn', vim.lsp.buf.rename, '✏️ [R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '🔧 [C]ode [A]ction', { 'n', 'v' })
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, '🏷️ Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '🔍 [D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '🌐 [W]orkspace [S]ymbols')
          map('<leader>wa', vim.lsp.buf.add_workspace_folder, '📁 [W]orkspace [A]dd Folder')
          map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '🗑️ [W]orkspace [R]emove Folder')
          map('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '📋 [W]orkspace [L]ist Folders')
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '❌ ',
            [vim.diagnostic.severity.WARN] = '⚠️ ',
            [vim.diagnostic.severity.INFO] = 'ℹ️ ',
            [vim.diagnostic.severity.HINT] = '💡 ',
          },
        },
      }
    end,
  },
}
