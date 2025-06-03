local lsp_configs = {}
for _, filepath in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
	local name = vim.fn.fnamemodify(filepath, ":t:r")
	table.insert(lsp_configs, name)
end
vim.lsp.enable(lsp_configs)

-- vim.g.rustaceanvim = function()
-- 	-- Update this path
-- 	local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
-- 	local codelldb_path = extension_path .. "adapter/codelldb"
-- 	local liblldb_path = extension_path .. "lldb/lib/liblldb"
-- 	local this_os = vim.uv.os_uname().sysname
--
-- 	liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
--
-- 	local cfg = require("rustaceanvim.config")
-- 	return {
-- 		dap = {
-- 			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
-- 		},
-- 	}
-- end
