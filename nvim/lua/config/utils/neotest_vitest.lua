local M = {}

--- Return the command to run vitest, preferring pnpm if available
---@return string
function M.vitest_cmd()
	if vim.fn.executable("pnpm") == 1 then
		return "pnpm vitest"
	end
	return "npx vitest"
end

--- Determine the root directory for running vitest commands.
---@param file string|nil
---@return string
function M.artifact_root(file)
	local uv = vim.uv or vim.loop
	file = file or vim.api.nvim_buf_get_name(0)
	if file == "" then
		return (uv and uv.cwd and uv.cwd()) or vim.fn.getcwd()
	end

	local cfg = vim.fs.find(
		{ "vitest.config.ts", "vitest.config.mts", "vitest.config.js", "vitest.config.mjs", "vitest.config.cjs" },
		{ path = vim.fs.dirname(file), upward = true }
	)[1]

	if cfg then
		return vim.fs.dirname(cfg)
	end

	-- Clamp to ".../artifact/<name>" if no explicit config is found
	local clamp = string.match(file, "(.-/artifact/[^/]+)/")
	if clamp then
		return clamp
	end

	return vim.fs.dirname(file)
end

--- Determine if a given path is a test file.
---@param path string
---@return boolean
function M.is_test_file(path)
	return path:match("/src/.*%.test%.ts$") ~= nil
end

return M
