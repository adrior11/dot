return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>m",
			function()
				require("treesj").toggle()
			end,
			desc = "Treesj toggle",
		},
		{
			"<leader>M",
			function()
				require("treesj").toggle({ recursive = true })
			end,
			desc = "Treesj toggle",
		},
	},
	opts = {
		use_default_keymaps = false,
		max_join_length = 300,
	},
}
