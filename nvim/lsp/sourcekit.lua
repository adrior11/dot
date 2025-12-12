-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/sourcekit.lua

local function root_pattern(...)
	local patterns = { ... }
	return function(filename)
		local match = vim.fs.find(patterns, {
			path = vim.fs.dirname(filename),
			upward = true,
		})[1]
		return match and vim.fs.dirname(match) or nil
	end
end

return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objc", "objcpp" },
	root_dir = function(bufnr, on_dir)
		local filename = vim.api.nvim_buf_get_name(bufnr)
		local dir = root_pattern("buildServer.json")(filename)
			or root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
			or root_pattern("compile_commands.json", "Package.swift")(filename)

		if not dir then
			local git = vim.fs.find(".git", { path = filename, upward = true })[1]
			if git then
				dir = vim.fs.dirname(git)
			end
		end

		-- fallback: directory of the file
		dir = dir or vim.fs.dirname(filename)

		on_dir(dir)
	end,
	get_language_id = function(_, ftype)
		local t = { objc = "objective-c", objcpp = "objective-cpp" }
		return t[ftype] or ftype
	end,
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
	},
}
