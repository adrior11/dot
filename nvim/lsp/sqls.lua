-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/sqls.lua

return {
	cmd = { "sqls" },
	filetypes = { "sql", "mysql" },
	root_markers = { "config.yml" },
	settings = {},

	single_file_support = true,
}
