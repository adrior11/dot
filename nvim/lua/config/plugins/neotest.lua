local util = require("config.utils.neotest_vitest")

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcasia/neotest-java",
		"nvim-neotest/neotest-plenary",
		"marilari88/neotest-vitest",
	},
	keys = {
		{
			"<leader>no",
			"<cmd>Neotest output<cr>",
			desc = "Show test output",
		},
		{
			"<leader>nO",
			"<cmd>Neotest output-panel<cr>",
			desc = "Show test output panel",
		},
		{
			"<leader>nr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<leader>nR",
			function()
				require("neotest").run.run(vim.fn.expand("%d"))
			end,
			desc = "Run the current file",
		},
		{
			"<leader>nd",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug nearest test",
		},
		{
			"<leader>nD",
			function()
				require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
			end,
			desc = "Debug the current file",
		},
		{
			"<leader>ns",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop nearest test",
		},
		{
			"<leader>na",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach to nearest test",
		},
	},
	config = function()
		require("neotest").setup({
			log_level = vim.log.levels.DEBUG,
			adapters = {
				require("rustaceanvim.neotest"),
				require("neotest-java"),
				require("neotest-plenary"),
				require("neotest-vitest")({
					vitestCommand = util.vitest_cmd(),
					cwd = function(node_or_path)
						local p = type(node_or_path) == "table" and node_or_path.path or node_or_path
						return util.artifact_root(p)
					end,
					is_test_file = util.is_test_file,
				}),
			},
		})
	end,
}
