return {
	"piersolenski/telescope-import.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = {
		{
			"<leader>fi",
			"<cmd>Telescope import<cr>",
			desc = "Telescope import",
		},
	},
	config = function()
		require("telescope").load_extension("import")
	end,
}
