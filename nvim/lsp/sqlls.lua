-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/sqlls.lua

return {
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	filetypes = { "sql", "mysql" },
	root_markers = { ".sqllsrc.json" },

	single_file_support = true,
}
