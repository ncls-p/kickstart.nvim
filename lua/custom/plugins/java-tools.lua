return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = { "java" },
  config = function()
    -- The JDTLS configuration will be automatically loaded when a Java file is opened
    -- through the ftplugin mechanism
    
    -- Create ftplugin directory if it doesn't exist
    local ftplugin_dir = vim.fn.stdpath("config") .. "/ftplugin"
    if vim.fn.isdirectory(ftplugin_dir) == 0 then
      vim.fn.mkdir(ftplugin_dir, "p")
    end
    
    -- Create the ftplugin/java.lua file if it doesn't exist
    local java_ftplugin = ftplugin_dir .. "/java.lua"
    if vim.fn.filereadable(java_ftplugin) == 0 then
      local file = io.open(java_ftplugin, "w")
      if file then
        file:write([[
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_mac' -- Adjust based on OS
local plugins_dir = jdtls_dir .. '/plugins/'
local path_to_jar = plugins_dir .. 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar' -- May need adjustment

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.expand('~/.cache/jdtls/workspace/') .. project_name

-- Main Config
local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', path_to_jar,
    '-configuration', config_dir,
    '-data', workspace_dir,
  },
  
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,
  
  -- Here you can configure eclipse.jdt.ls specific settings
  settings = {
    java = {
      home = vim.fn.expand('$JAVA_HOME'),
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-11",
            path = vim.fn.expand('$JAVA_HOME'),
          },
          {
            name = "JavaSE-17",
            path = vim.fn.expand('$JAVA_HOME'),
          },
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = jdtls_dir .. "/formatter.xml",
        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      filteredTypes = {
        "com.sun.*",
        "io.micrometer.shaded.*",
        "java.awt.*",
        "jdk.*",
        "sun.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = {
      progressReportProvider = true,
      classFileContentsSupport = true,
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  
  flags = {
    allow_incremental_sync = true,
  },
  
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  init_options = {
    bundles = {},
  },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

-- Java specific keymaps
vim.keymap.set('n', '<leader>jo', function() require('jdtls').organize_imports() end, { buffer = true, desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>jv', function() require('jdtls').extract_variable() end, { buffer = true, desc = 'Extract Variable' })
vim.keymap.set('n', '<leader>jc', function() require('jdtls').extract_constant() end, { buffer = true, desc = 'Extract Constant' })
vim.keymap.set('n', '<leader>jm', function() require('jdtls').extract_method() end, { buffer = true, desc = 'Extract Method' })
]])
        file:close()
      end
    end
  end,
}
