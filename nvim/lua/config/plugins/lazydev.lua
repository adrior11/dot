return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "${3rd}/love2d/library", words = { "love" } },
				{ path = "${3rd}/busted/library", file = { "%spec.lua" } },
				{ path = "${3rd}/luassert/library", file = { "%spec.lua" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
}
