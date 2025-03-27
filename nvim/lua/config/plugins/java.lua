return {
	"nvim-java/nvim-java",
	dependencies = {
		"JavaHello/spring-boot.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("java").setup({
			-- java_test = { enable = false },
			jdk = { auto_install = false },
			notifications = { dap = false },
		})
		vim.diagnostic.config({ virtual_text = true })
	end,
}
