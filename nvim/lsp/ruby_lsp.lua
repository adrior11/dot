-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ruby_lsp.lua

return {
	cmd = { "ruby-lsp" },
	filetypes = { "ruby", "eruby" },
	root_markers = { "Gemfile", ".git" },

	single_file_support = true,
}
