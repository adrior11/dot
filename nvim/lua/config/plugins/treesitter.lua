return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		cmd = "TSInstallInfo",
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
