return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}

		dap.adapters["pwa-node"] = {
			type = "server",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = { "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					return vim.fn.split(vim.fn.input("Arguments: "), " ")
				end,
			},
		}

		dap.configurations.c = dap.configurations.cpp

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					return vim.fn.split(vim.fn.input("Arguments: "), " ")
				end,
				-- Optional: Inherit environment variables
				env = function()
					local variables = {}
					for k, v in pairs(vim.fn.environ()) do
						table.insert(variables, string.format("%s=%s", k, v))
					end
					return variables
				end,
			},
		}

		dap.configurations.scala = {
			{
				name = "RunOrTest",
				type = "scala",
				request = "launch",
				metals = {
					runType = "runOrTestFile",
					args = function()
						return vim.fn.split(vim.fn.input("Arguments: "), " ")
					end,
				},
			},
			{
				name = "Test Target",
				type = "scala",
				request = "launch",
				metals = {
					runType = "testTarget",
				},
			},
		}

		dap.configurations.typescript = {
			{
				name = "Launch",
				type = "pwa-node",
				request = "launch",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "pnpm",
				args = function()
					return vim.fn.split(vim.fn.input("Arguments: "), " ")
				end,
				autoAttachChildProcesses = true,
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
				sourceMaps = true,
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
				skipFiles = { "<node_internals>/**" },
			},
		}
	end,
	keys = {
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP Toggle breakpoint",
		},
		{
			"<leader>bl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "DAP Set breakpoint logs",
		},
		{
			"<leader>bc",
			function()
				require("dap").clear_breakpoints()
			end,
			desc = "DAP Clear all breakpoints",
		},
		{
			"<f5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP Continue/Start",
		},
		{
			"<F6>",
			function()
				require("dap").run_last()
			end,
			desc = "DAP Run last session",
		},
		{
			"<F7>",
			function()
				require("dap").terminate()
			end,
			desc = "DAP Terminate session",
		},
		{
			"<F9>",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "DAP Show hover information",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP Step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP Step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP Step out",
		},
	},
}
