return {
    'mfussenegger/nvim-dap',
    config = function ()
        local dap = require("dap")

        dap.adapters.lldb = {
          type = 'executable',
          command = '/usr/local/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
          name = 'lldb'
        }

        dap.configurations.cpp = {
          {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
          },
        }

        dap.configurations.rust = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},

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
                    local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                    local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                    local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                    local commands = {}
                    local file = io.open(commands_file, 'r')
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

        dap.configurations.c = dap.configurations.cpp

        vim.keymap.set('n', '<leader>dt', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
        vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end)
        vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
        vim.keymap.set('n', '<leader>du', function() require('dap').step_out() end)
    end,
}
