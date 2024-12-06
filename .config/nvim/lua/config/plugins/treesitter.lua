-- FIX: Astro: https://www.lazyvim.org/plugins/treesitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = "VeryLazy",
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
