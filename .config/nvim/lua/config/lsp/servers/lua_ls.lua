return {
    settings = {
        Lua = {
            diagnostics = {
                -- WARN: Suppress vim warning
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
}

