-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/kotlin_lsp.lua

return {
	cmd = { "kotlin-lsp", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = {
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		"workspace.json",
	},
}
