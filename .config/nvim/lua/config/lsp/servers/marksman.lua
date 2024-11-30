return {
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", ".marksman.yaml"),
}
