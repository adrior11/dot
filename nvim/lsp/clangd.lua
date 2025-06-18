-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/clangd.lua

return {
	cmd = { "clangd" },
	filetypes = { "c", "h", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		".git",
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
