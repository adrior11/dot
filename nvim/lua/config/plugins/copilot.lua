return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		filetypes = {
			markdown = true,
		},
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
