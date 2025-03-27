return {
	"axkirillov/telescope-changed-files",
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = {
		{
			"<leader>fc",
			"<cmd>Telescope changed_files<cr>",
			desc = "Telescope changed files",
		},
	},
	config = function()
		require("telescope").load_extension("changed_files")
	end,
}
