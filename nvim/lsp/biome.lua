-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/biome.lua

return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"astro",
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},
}
