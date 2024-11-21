return {
    'mfussenegger/nvim-dap',
    cmd = 'DapNew',
    config = function()
        local dap = require('dap')
        local widgets = require('dap.ui.widgets')
        local repl = require ('dap.repl')

        local function open_sidebar_at_bottom()
            local sidebar = widgets.sidebar(widgets.scopes)
            sidebar.open()
            vim.cmd('wincmd K') -- Move the sidebar to the bottom
        end

        dap.adapters.lldb = {
          type = 'executable',
          command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
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

        -- TODO: Configure dap for C
        dap.configurations.c = dap.configurations.cpp

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
                -- args = {},
                args = function()
                    return vim.fn.split(vim.fn.input('Arguments: '), ' ')
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

        vim.keymap.set('n', '<leader>dt', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
        vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
        vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
        vim.keymap.set('n', '<leader>du', function() dap.step_out() end)
        vim.keymap.set('n', '<leader>dx', function() dap.clear_breakpoints() end)
        vim.keymap.set('n', '<leader>d', function() dap.terminate() end)
        vim.keymap.set('n', '<leader>dr', function() repl.open() end)
        vim.keymap.set('n', '<leader>dh', function() widgets.hover() end)
        vim.keymap.set('n', '<leader>ds', open_sidebar_at_bottom)
    end,
}
