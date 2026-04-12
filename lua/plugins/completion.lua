return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "Saghen/blink.cmp",
    version = "*",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      signature = { enabled = true },
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
      },
      completion = {
        selection = { preselect = true, auto_insert = true },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
      },
    },
  },
}
