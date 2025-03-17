return {
  -- DevOps tools configuration
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      
      local cfg = require("yaml-companion").setup({
        -- Built-in schemas
        builtin_schemas = {
          kubernetes = {
            "deployments.yaml",
            "services.yaml",
            "statefulsets.yaml",
            "configmaps.yaml",
            "pods.yaml",
          },
          docker_compose = {
            "docker-compose.yml",
            "docker-compose.yaml",
          },
          github_workflow = {
            ".github/workflows/*.yml",
            ".github/workflows/*.yaml",
          },
          gitlab_ci = {
            ".gitlab-ci.yml",
          },
          helm = {
            "Chart.yaml",
            "values.yaml",
          },
        },
        -- Additional schemas to download
        schemas = {
          {
            name = "Kubernetes",
            uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0-standalone-strict/all.json",
          },
          {
            name = "Docker Compose",
            uri = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
          },
        },
      })
      
      -- Register the language server
      require("lspconfig")["yamlls"].setup(cfg)
      
      -- Add keymaps for YAML files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "yaml", "yml" },
        callback = function()
          vim.keymap.set("n", "<leader>ys", "<cmd>Telescope yaml_schema<CR>", { buffer = true, desc = "📄 [Y]AML [S]chema" })
        end,
      })
    end,
  },
  
  -- Terraform support
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "hcl" },
    config = function()
      -- Add keymaps for Terraform files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "terraform", "tf", "hcl" },
        callback = function()
          vim.keymap.set("n", "<leader>ti", "<cmd>TerraformInit<CR>", { buffer = true, desc = "🏗️ [T]erraform [I]nit" })
          vim.keymap.set("n", "<leader>tv", "<cmd>TerraformValidate<CR>", { buffer = true, desc = "✅ [T]erraform [V]alidate" })
          vim.keymap.set("n", "<leader>tp", "<cmd>TerraformPlan<CR>", { buffer = true, desc = "📝 [T]erraform [P]lan" })
          vim.keymap.set("n", "<leader>ta", "<cmd>TerraformApply<CR>", { buffer = true, desc = "🚀 [T]erraform [A]pply" })
        end,
      })
    end,
  },
  
  -- Docker support
  {
    "dgrbrady/nvim-docker",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "DockerContainers",
      "DockerImages",
      "DockerNetworks",
      "DockerVolumes",
      "DockerCompose",
    },
    config = function()
      require("docker").setup({
        -- Docker configuration options
      })
      
      -- Add Docker keymaps
      vim.keymap.set("n", "<leader>dc", "<cmd>DockerContainers<CR>", { desc = "🐳 [D]ocker [C]ontainers" })
      vim.keymap.set("n", "<leader>di", "<cmd>DockerImages<CR>", { desc = "🖼️ [D]ocker [I]mages" })
      vim.keymap.set("n", "<leader>dn", "<cmd>DockerNetworks<CR>", { desc = "🌐 [D]ocker [N]etworks" })
      vim.keymap.set("n", "<leader>dv", "<cmd>DockerVolumes<CR>", { desc = "💾 [D]ocker [V]olumes" })
      vim.keymap.set("n", "<leader>dp", "<cmd>DockerCompose<CR>", { desc = "📦 [D]ocker Com[p]ose" })
    end,
  },
  
  -- Kubernetes support
  {
    "arjunmahishi/k8s.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("k8s").setup({
        -- Kubernetes configuration options
      })
      
      -- Add Kubernetes keymaps
      vim.keymap.set("n", "<leader>kc", "<cmd>K8sContexts<CR>", { desc = "☸️ [K]8s [C]ontexts" })
      vim.keymap.set("n", "<leader>kn", "<cmd>K8sNamespaces<CR>", { desc = "🔍 [K]8s [N]amespaces" })
      vim.keymap.set("n", "<leader>kp", "<cmd>K8sPods<CR>", { desc = "🔄 [K]8s [P]ods" })
      vim.keymap.set("n", "<leader>kd", "<cmd>K8sDescribe<CR>", { desc = "📋 [K]8s [D]escribe" })
      vim.keymap.set("n", "<leader>kl", "<cmd>K8sLogs<CR>", { desc = "📜 [K]8s [L]ogs" })
    end,
  },
  
  -- Scala support
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt" },
    config = function()
      local metals_config = require("metals").bare_config()
      
      -- Configure metals
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
      }
      
      -- Metals setup
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
          
          -- Scala-specific keymaps
          vim.keymap.set("n", "<leader>mc", require("metals").commands, { buffer = true, desc = "⚙️ [M]etals [C]ommands" })
          vim.keymap.set("n", "<leader>mt", require("metals").toggle_setting, { buffer = true, desc = "🔄 [M]etals [T]oggle Setting" })
        end,
      })
    end,
  },
}
