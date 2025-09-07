-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua

return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		-- html
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir", -- vim ft
		"elixir",
		"ejs",
		"erb",
		"eruby", -- vim ft
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"htmlangular",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
		"templ",
	},
	init_options = { userLanguages = { templ = "html", heex = "html", eex = "html" } },
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					-- common utilities
					{ "clsx\\(([^)]*)\\)", "'([^']*)'|\"([^\"]*)\"" },
					{ "cn\\(([^)]*)\\)", "'([^']*)'|\"([^\"]*)\"" },
					{ "cva\\(([^)]*)\\)", "'([^']*)'|\"([^\"]*)\"" },
					{ "tv\\(([^)]*)\\)", "'([^']*)'|\"([^\"]*)\"" },
					{ "twMerge\\(([^)]*)\\)", "'([^']*)'|\"([^\"]*)\"" },
				},
			},
		},
	},
}
