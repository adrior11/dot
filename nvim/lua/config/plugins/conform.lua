-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "prettier" },
			bash = { "shfmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			elixir = { "mix" },
			go = { "gofmt" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			ruby = { "rubyfmt" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
			sql = { "sqruff" },
			tex = { "tex-fmt" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			zig = { "zigfmt" },
		},
		lsp_fallback = true,
	},
}
