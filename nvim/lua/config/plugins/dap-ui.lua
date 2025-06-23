return {
	"rcarriga/nvim-dap-ui",
	lazy = true,
	opts = {
		controls = {
			enabled = false,
		},
	},
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP Toggle UI",
		},
	},
}
