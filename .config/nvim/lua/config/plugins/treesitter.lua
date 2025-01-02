-- FIX: Astro: https://www.lazyvim.org/plugins/treesitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = "VeryLazy", -- NOTE: This should be either true or field event
		build = ":TSUpdate",
		opts = {
			ensure_installed = "maintained",
			sync_install = true,
			auto_install = true,
		},
	},
	{
		"IndianBoy42/tree-sitter-just",
		event = "BufRead justfile",
		opts = {},
	},
}
