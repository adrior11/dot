return {
	"piersolenski/import.nvim",
	dependencies = {
		"folke/snacks.nvim",
	},
	opts = {
		picker = "snacks",
		insert_at_top = true,
	},
	keys = {
		{
			"<leader>fi",
			function()
				require("import").pick()
			end,
			desc = "Import (from project usage)",
			mode = { "n", "x" },
		},
	},
}
