-- LSP server configurations
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Basic capabilities
      local capabilities = vim.tbl_deep_extend(
        'force', 
        vim.lsp.protocol.make_client_capabilities(), 
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- Simplified server configurations - only essential settings
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              workspace = { library = { vim.fn.expand('$VIMRUNTIME/lua'), vim.fn.stdpath('config') .. '/lua' } },
            },
          },
        },
        -- Common servers with minimal configs
        eslint = {},
        pyright = {},
        marksman = {},
        rust_analyzer = {},
        solidity = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        gopls = {},
        clangd = {},
        intelephense = {},
        kotlin_language_server = {},
        terraformls = {},
        dockerls = {},
        graphql = {},
      }

      -- Core tools list - reduced to essentials
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- Essential formatters
        'stylua',      -- Lua
        'prettier',    -- JS/TS/Web
        'black',       -- Python
        'rustfmt',     -- Rust
        
        -- Essential linters
        'eslint_d',    -- JS/TS
        'ruff',        -- Python
      })
      
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      -- Simplified handler
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = capabilities
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Set up sourcekit for Mac
      if vim.fn.has('mac') == 1 then
        require('lspconfig').sourcekit.setup({ capabilities = capabilities })
      end
    end,
  },
}
