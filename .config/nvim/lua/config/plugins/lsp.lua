return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- Run :MasonUpdate when mason.nvim is installed
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.sourcekit.setup {
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(_)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
                end,
            })
        end,
    }
}

