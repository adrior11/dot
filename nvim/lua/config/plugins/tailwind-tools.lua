return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx" },
	dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	opts = {},
}
