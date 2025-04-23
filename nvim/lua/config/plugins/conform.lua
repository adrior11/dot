return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "prettier" },
			c = { "clang_format" },
			elixir = { "mix" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			swift = { "swift_format" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
	},
}
