-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/marksman.lua

return {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
	root_markers = { ".marksman.toml", ".marksman.yaml", ".git" },

	single_file_support = true,
}
