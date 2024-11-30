return {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_dir = require("lspconfig.util").root_pattern(".git", "build.zig"),
}
