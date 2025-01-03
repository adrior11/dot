return {
	"mfussenegger/nvim-dap",
	cmd = "DapNew",
	config = function()
		local dap = require("dap")
		local widgets = require("dap.ui.widgets")
		local repl = require("dap.repl")
		local sidebar = widgets.sidebar(widgets.scopes)

		dap.listeners.before.attach.dapui_config = function()
			sidebar.open()
			repl.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			repl.open()
			sidebar.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			sidebar.close()
			repl.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			sidebar.close()
			repl.close()
		end

		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- adjust as needed, must be absolute path
			name = "lldb",
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
				initCommands = function()
					-- Find out where to look for the pretty printer Python module
					local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

					local script_import = 'command script import "'
						.. rustc_sysroot
						.. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

					local commands = {}
					local file = io.open(commands_file, "r")
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
						file:close()
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
			},
		}

		vim.keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, { desc = "DAP Toggle breakpoint" })

		vim.keymap.set("n", "<Leader>bl", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "DAP DAP Set breakpoint logs" })

		vim.keymap.set("n", "<leader>bc", function()
			dap.clear_breakpoints()
		end, { desc = "DAP Clear all breakpoints" })

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "DAP Continue/Start" })

		vim.keymap.set("n", "<F6>", function()
			require("dap").run_last()
		end, { desc = "DAP Run last session" })

		vim.keymap.set("n", "<F7>", function()
			dap.terminate()
		end, { desc = "DAP Terminate session" })

		vim.keymap.set("n", "<F9>", function()
			widgets.hover()
		end, { desc = "DAP Show hover information" })

		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "DAP Step over" })

		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "DAP Step into" })

		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "DAP Step out" })

		vim.keymap.set("n", "<leader>dr", function()
			repl.open()
		end, { desc = "DAP Open REPL" })

		vim.keymap.set("n", "<leader>ds", function()
			sidebar.open()
		end, { desc = "DAP Show scopes" })
	end,
}
