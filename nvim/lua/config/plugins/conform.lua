-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "biome-organize-imports", "biome" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			elixir = { "mix" },
			go = { "gofmt" },
			java = { "google-java-format" },
			javascript = { "biome-organize-imports", "biome" },
			json = { "prettier" },
			lua = { "stylua" },
			sql = { "sqruff" },
			ruby = { "rubyfmt" },
			rust = { "rustfmt" },
			swift = { "swift_format" },
			typescript = { "biome-organize-imports", "biome" },
			typescriptreact = { "biome-organize-imports", "biome" },
		},
		lsp_fallback = true,
	},
}
