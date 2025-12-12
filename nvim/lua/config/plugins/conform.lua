-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "biome-organize-imports", "biome" },
			bash = { "shfmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			elixir = { "mix" },
			go = { "gofmt" },
			java = { "google-java-format" },
			javascript = { "biome-organize-imports", "biome" },
			json = { "prettier" },
			kotlin = { "ktlint" },
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			ruby = { "rubyfmt" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
			swift = { "swift_format" },
			sql = { "sqruff" },
			tex = { "tex-fmt" },
			typescript = { "biome-organize-imports", "biome" },
			typescriptreact = { "biome-organize-imports", "biome" },
			zig = { "zigfmt" },
		},
		lsp_fallback = true,
	},
}
