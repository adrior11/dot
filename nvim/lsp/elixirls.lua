-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/elixirls.lua

return {
	cmd = { "/opt/homebrew/opt/elixir-ls/libexec/language_server.sh" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
