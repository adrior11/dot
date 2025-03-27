return {
	"atm1020/neotest-jdtls",
	ft = "java",
	dependencies = { "nvim-neotest/neotest" },
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jdtls"),
			},
		})
	end,
}
