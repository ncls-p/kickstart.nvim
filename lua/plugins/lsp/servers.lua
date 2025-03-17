-- LSP server configurations
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Server configuration
      local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { globals = { 'vim' } },
              workspace = {
                library = {
                  [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                  [vim.fn.stdpath 'config' .. '/lua'] = true,
                },
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        -- React
        eslint = {},
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
              },
            },
          },
        },
        -- Markdown
        marksman = {},
        -- Rust
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'clippy',
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
        -- Scala is handled by nvim-metals plugin
        -- Solidity
        solidity = {},
        -- HTML/CSS
        html = {},
        cssls = {},
        -- JSON
        jsonls = {},
        -- YAML
        yamlls = {},
        -- Go
        gopls = {},
        -- C/C++
        clangd = {},
        -- Ruby
        solargraph = {},
        -- PHP
        intelephense = {},
        -- Swift
        -- sourcekit is built into macOS and doesn't need to be installed via Mason
        -- We'll set it up manually outside of Mason
        -- Kotlin
        kotlin_language_server = {},
        -- Terraform
        terraformls = {},
        -- Docker
        dockerls = {},
        -- GraphQL
        graphql = {},
      }

      -- Install servers and tools
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- Language servers
        -- Formatters
        'stylua', -- Lua formatter
        'prettier', -- JS/TS/React/HTML/CSS/JSON/YAML formatter
        'eslint_d', -- JS/TS/React linter
        'ruff', -- Python linter and formatter
        'markdownlint', -- Markdown linter
        'google-java-format', -- Java formatter
        'rustfmt', -- Rust formatter
        'goimports', -- Go imports formatter
        'clang-format', -- C/C++ formatter
        'php-cs-fixer', -- PHP formatter
        'ktlint', -- Kotlin formatter/linter
        'shfmt', -- Shell formatter

        -- Linters
        'solhint', -- Solidity linter
        'htmlhint', -- HTML linter
        'stylelint', -- CSS linter
        'golangci-lint', -- Go linter
        'phpcs', -- PHP linter
        'tflint', -- Terraform linter
        'yamllint', -- YAML linter
        'shellcheck', -- Shell linter
        'hadolint', -- Dockerfile linter

        -- DevOps specific tools
        'helm-ls', -- Helm language server
        'docker-compose-language-service', -- Docker Compose language server
        'terraform-ls', -- Terraform language server
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

            -- Set up the server
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Set up sourcekit manually since it's not available via Mason
      if vim.fn.has 'mac' == 1 then
        local sourcekit_server = servers['sourcekit_lsp'] or {}
        sourcekit_server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, sourcekit_server.capabilities or {})
        require('lspconfig')['sourcekit'].setup(sourcekit_server)
      end
    end,
  },
}
