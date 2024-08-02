local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

-- Setup Mason LSPconfig
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "clangd",
        "jsonls",
        "jdtls",
        "texlab",
        "zls",
        "hls",
        "marksman",
    },
})

-- Function to setup each LSP server
local function setup_servers()
    local lspconfig = require("lspconfig")
    local servers = {
        "lua_ls",
        "pyright",
        "bashls",
        "clangd",
        "jsonls",
        "jdtls",
        "texlab",
        "zls",
        "hls",
        "marksman",
    }

    for _, server in ipairs(servers) do
        local opts = {
            on_attach = require("config.lsp.on_attach"),
            capabilities = require("config.lsp.capabilities"),
        }

        local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.servers." .. server)

        if has_custom_opts then
            opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
        end

        lspconfig[server].setup(opts)
    end
end

setup_servers()
