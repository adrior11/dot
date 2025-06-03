-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua

return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },

	single_file_support = true,
}
