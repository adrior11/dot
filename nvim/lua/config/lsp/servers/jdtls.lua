return {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_dir = require("lspconfig.util").root_pattern(".git", "pom.xml", "build.gradle"),
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
		},
	},
}
