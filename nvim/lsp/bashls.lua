-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bashls.lua

return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},

	single_file_support = true,
}
