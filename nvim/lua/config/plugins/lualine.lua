local colors = require("config.utils.color").colors()

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"letieu/harpoon-lualine",
		"kyazdani42/nvim-web-devicons",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = {
				normal = {
					a = { fg = colors.dark0_hard, bg = colors.neutral_blue },
					b = { fg = colors.light1, bg = colors.dark1 },
					c = { fg = colors.light1, bg = colors.dark0 },
				},
				insert = { a = { fg = colors.dark0_hard, bg = colors.neutral_green } },
				visual = { a = { fg = colors.dark0_hard, bg = colors.neutral_yellow } },
				replace = { a = { fg = colors.dark0_hard, bg = colors.neutral_red } },
				command = { a = { fg = colors.dark0_hard, bg = colors.neutral_purple } },
				inactive = {
					a = { fg = colors.light1, bg = colors.dark0 },
					b = { fg = colors.light1, bg = colors.dark0 },
					c = { fg = colors.light1, bg = colors.dark0 },
				},
			},
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"branch",
					icon = "",
					color = { fg = colors.light1, bg = colors.dark1 },
				},
				"diff",
				"diagnostics",
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
						unnamed = "[No Name]",
						newfile = "[New]",
					},
				},
			},
			lualine_x = {
				{
					"harpoon2",
					indicators = { "1", "2", "3", "4", "5" },
					active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
					_seperator = " ",
				},
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
