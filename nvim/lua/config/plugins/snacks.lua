return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfiles = { enabled = false },
		bufdelete = { enabled = false },
		debug = { enabled = false },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enabled = true },
		notify = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = false },
		statuscolumn = { enabled = false },
		terminal = { enabled = false },
		toggle = { enabled = false },
		win = { enabled = false },
		words = { enabled = false },
		styles = {
			notifications = {
				wo = { wrap = true },
			},
		},
	},
	keys = {
		{
			"<leader>hn",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
}
