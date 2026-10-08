return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			styles = {
				comments = { italic = true },
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				-- docstrings read like comments, not like regular strings
				hl["@string.documentation"] = { fg = c.comment, italic = true }
				hl["@string.documentation.python"] = { fg = c.comment, italic = true }
				hl.TabLineFill = { bg = "NONE" }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
