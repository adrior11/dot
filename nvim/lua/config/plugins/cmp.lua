return {
	{
		"hrsh7th/nvim-cmp",
		event = { "CmdlineEnter", "InsertEnter", "LspAttach" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"tamago324/cmp-zsh",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			require("config.completion")
		end,
		-- Lazydev Configuration
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- skip loading LuaLS completions
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				fix_pairs = true,
			})
		end,
	},
}
