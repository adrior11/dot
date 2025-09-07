return {
	"windwp/nvim-ts-autotag",
	event = { "InsertEnter", "BufReadPre" },
	opts = {
		opts = {
			enable_close_on_slash = true,
			filetypes = {
				"html",
				"xml",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"tsx",
				"jsx",
				"svelte",
				"vue",
				"astro",
			},
		},
	},
}
