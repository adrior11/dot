return {
	"nvim-telescope/telescope-file-browser.nvim",
	keys = {
		{
			"<leader>fe",
			"<cmd>Telescope file_browser<cr>",
			desc = "Telescope file browser",
		},
		{
			"<leader>fb",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			desc = "Telescope file browser from path",
		},
	},
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
