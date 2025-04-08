local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"elixirls",
		-- "hls",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"texlab",
		"ts_ls",
		"zls",
		"sqlls",
	},
})

local function setup_servers()
	local lspconfig = require("lspconfig")
	local servers = {
		"bashls",
		"clangd",
		"elixirls",
		-- "hls",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"texlab",
		"ts_ls",
		"zls",
		-- "sqlls",
	}

	for _, server in ipairs(servers) do
		local opts = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}

		local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.servers." .. server)

		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end

		lspconfig[server].setup(opts)
	end

	vim.g.rustaceanvim = function()
		-- Update this path
		local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb"
		local this_os = vim.uv.os_uname().sysname

		liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

		local cfg = require("rustaceanvim.config")
		return {
			dap = {
				adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		}
	end
end

setup_servers()
