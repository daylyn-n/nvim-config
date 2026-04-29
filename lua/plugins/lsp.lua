return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason-lspconfig").setup()

      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua_ls",
          "stylua",
          "clangd",
          "pyright",
          "jdtls",
          "ts_ls",
          "prettier",
          "eslint_d",
          "jsonls",
          "yamlls",
          "dockerls",
          "docker_compose_language_service",
          "sqls",
          "tailwindcss",
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim", "require" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { ".git", "compile_commands.json", "CMakeLists.txt" },
      })

      vim.lsp.config("pyright", {})

      vim.lsp.config("ts_ls", {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
      })

      vim.lsp.config("jsonls", {
        filetypes = { "json", "jsonc" },
      })

      vim.lsp.config("yamlls", {
        filetypes = { "yaml", "yml" },
      })

      vim.lsp.config("dockerls", {})
      vim.lsp.config("docker_compose_language_service", {
        filetypes = { "yaml.docker-compose" },
      })

      vim.lsp.config("sqls", {})
      vim.lsp.config("tailwindcss", {})

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("dockerls")
      vim.lsp.enable("docker_compose_language_service")
      vim.lsp.enable("sqls")
      vim.lsp.enable("tailwindcss")
    end,
  },
}
