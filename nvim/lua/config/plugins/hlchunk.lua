local colors = require("config.utils.color").colors()

return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		chunk = {
			enable = true,
			use_treesitter = true,
			style = {
				{ fg = colors.gray, bg = colors.bg },
			},
		},
		indent = {
			enable = true,
			style = {
				{ fg = colors.dark2, bg = colors.bg },
			},
		},
		blank = {
			enable = false,
		},
		line_num = {
			enable = true,
			style = {
				{ fg = colors.neutral_orange, bg = colors.bg },
			},
		},
	},
}
