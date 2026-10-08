return {
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- main branch requires Neovim 0.12; master is the 0.11-compatible branch
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"typescript",
				"tsx",
				"javascript",
				"html",
				"css",
				"json",
				"yaml",
				"dockerfile",
				"sql",
				"lua",
				"python",
				"c",
				"cpp",
				"java",
				"bash",
				"markdown",
				"markdown_inline",
				"gitignore",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
		end,
	},
}
