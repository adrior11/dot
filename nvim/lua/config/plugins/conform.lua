return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "prettier" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			elixir = { "mix" },
			go = { "gofmt" },
			java = { "google-java-format" },
			javascript = { "biome", "biome-organize-imports" },
			json = { "prettier" },
			lua = { "stylua" },
			ruby = { "rubyfmt" },
			rust = { "rustfmt" },
			swift = { "swift_format" },
			typescript = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
		},
	},
}
