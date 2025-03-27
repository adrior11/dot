return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			swift = { "swift_format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			astro = { "prettier" },
			typescriptreact = { "prettier" },
			java = { "google-java-format" },
		},
	},
}
