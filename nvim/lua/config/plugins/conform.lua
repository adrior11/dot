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
			javascript = { "eslint_d", "prettier" },
			javascriptreact = { "eslint_d", "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			ruby = { "rubyfmt" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
			sql = { "sqruff" },
			tex = { "tex-fmt" },
			typescript = { "eslint_d", "prettier" },
			typescriptreact = { "eslint_d", "prettier" },
			zig = { "zigfmt" },
		},
		lsp_fallback = true,
	},
}
