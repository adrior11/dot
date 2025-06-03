return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
	keys = {
		{
			"<leader>cp",
			"<cmd>Copilot panel<cr>",
			desc = "Open Copilot panel",
		},
	},
}
