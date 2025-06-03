-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/zls.lua

return {
	cmd = { "zls" },
	filetypes = { "zig", "zir" },
	root_markers = { "zls.json", "build.zig", ".git" },

	single_file_support = true,
}
