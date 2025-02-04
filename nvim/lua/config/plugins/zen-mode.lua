return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		plugins = {
			twilight = { enabled = false },
		},
	},
	keys = {
		{
			"<leader>zz",
			"<cmd>ZenMode<CR>",
			desc = "ZenMode",
		},
	},
}
