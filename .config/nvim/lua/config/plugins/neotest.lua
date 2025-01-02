local jestCommand = function(file)
	local service_name = string.match(file, "apps/([^/]+)/")
	if service_name then
		-- Determine the appropriate target based on the file name
		local command = "pnpm "
		if string.find(file, "int%-spec%.ts") then
			command = command .. "test-int "
		else
			command = command .. "test "
		end
		return command .. service_name .. " --verbose"
	end
	-- Fallback to a default command
	return "pnpm test"
end

local jestConfigFile = function(file)
	local service_path = string.match(file, "(apps/[^/]+)/")
	if service_path then
		local config_path = service_path .. "jest.config.js"
		if vim.fn.filereadable(config_path) == 1 then
			return config_path
		end
	end
	-- Fallback to a root-level Jest config, if necessary
	return vim.fn.getcwd() .. "/jest.config.js"
end

-- NOTE: Can neovim jump to file from path like VSCode?
-- :h neotest.diagnostic
-- :h neotest.summary
-- :h neotest.output_panel
-- :h neotest.watch
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
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
			"<leader>no",
			"<cmd>Neotest output<cr>",
			desc = "Show test output",
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
			"<leader>ns",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop nearest test",
		},
		{
			"<leader>nd",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach to nearest test",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("rustaceanvim.neotest")({
					args = { "--test-threads=1" },
				}),
				-- TODO: Fix jest setup for monorepo
				require("neotest-jest")({
					-- jestCommand = jestCommand,
					jestCommand = "pnpm test --",
					jestConfigFile = jestConfigFile,
				}),
			},
		})
	end,
}
