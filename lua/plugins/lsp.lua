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

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
    end,
  },
}
