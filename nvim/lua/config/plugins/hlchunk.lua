return {
	"shellRaining/hlchunk.nvim",
	event = "VeryLazy",
	opts = {
		chunk = {
			enable = true,
			use_treesitter = true,
			style = {
				vim.api.nvim_get_hl(0, { name = "Title" }),
			},
		},
		indent = {
			enable = true,
			style = {
				vim.api.nvim_get_hl(0, { name = "LineNr" }),
			},
		},
		blank = {
			enable = false,
		},
		line_num = {
			enable = true,
			style = {},
		},
	},
}
