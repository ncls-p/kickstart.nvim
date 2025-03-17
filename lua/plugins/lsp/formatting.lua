-- Formatting configuration
return {
  -- Formatting
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
        desc = '✨ [F]ormat buffer',
      },
    },
    init = function()
      -- Create a .prettierrc file in the Neovim config directory if it doesn't exist
      local prettier_config_path = vim.fn.stdpath 'config' .. '/.prettierrc'
      if vim.fn.filereadable(prettier_config_path) == 0 then
        local prettier_config = {
          printWidth = 100,
          tabWidth = 2,
          useTabs = false,
          semi = true,
          singleQuote = true,
          trailingComma = 'es5',
          bracketSpacing = true,
          arrowParens = 'avoid',
          endOfLine = 'lf',
        }
        local file = io.open(prettier_config_path, 'w')
        if file then
          file:write(vim.json.encode(prettier_config))
          file:close()
          vim.notify('Created default .prettierrc in ' .. vim.fn.stdpath 'config', vim.log.levels.INFO)
        end
      end
    end,
    opts = {
      -- Define a function to determine if prettier should be used
      formatters_by_ft = (function()
        -- List of filetypes that prettier supports
        local prettier_filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'vue',
          'css',
          'scss',
          'less',
          'html',
          'json',
          'jsonc',
          'yaml',
          'markdown',
          'markdown.mdx',
          'graphql',
          'handlebars',
          'svelte',
          'xml',
          'dockerfile',
          -- DevOps related files
          'yaml.docker-compose',
          'yaml.helm',
          'hcl',
          'terraform',
        }

        -- Create a table to store the formatter configuration
        local formatters = {
          lua = { 'stylua' },
          python = { 'ruff_format', 'ruff_fix' },
          java = { 'google_java_format' },
          rust = { 'rustfmt' },
          scala = { 'scalafmt' },
          solidity = {},
          go = { 'goimports' },
          c = { 'clang_format' },
          cpp = { 'clang_format' },
          php = { 'php_cs_fixer' },
          swift = { 'swiftformat' },
          kotlin = { 'ktlint' },
          terraform = { 'terraform_fmt' },
          hcl = { 'terraform_fmt' }, -- HCL files (Terraform, Packer, etc.)
          dockerfile = { 'prettier' },
          sh = { 'shfmt' },
          bash = { 'shfmt' },
          zsh = { 'shfmt' },
        }

        -- Set prettier as the formatter for all supported filetypes
        for _, ft in ipairs(prettier_filetypes) do
          formatters[ft] = { 'prettier' }
        end

        return formatters
      end)(),
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
        async = true,
      },
    },
  },
}
