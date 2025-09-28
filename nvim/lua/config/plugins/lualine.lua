return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"letieu/harpoon-lualine",
		"kyazdani42/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
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
				},
				"diff",
				"copilot",
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
