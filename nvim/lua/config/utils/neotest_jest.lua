local M = {}

local jest_configs = {
	"jest.config.ts",
	"jest.config.js",
	"jest.config.mjs",
	"jest.config.cjs",
}

function M.jest_cmd()
	if vim.fn.executable("pnpm") == 1 then
		return "pnpm exec jest"
	end
	return "npx jest"
end

function M.project_root(file)
	file = file or vim.api.nvim_buf_get_name(0)
	if file == "" then
		return vim.fn.getcwd()
	end

	local project_json = vim.fs.find("project.json", {
		path = vim.fs.dirname(file),
		upward = true,
	})[1]
	if project_json then
		return vim.fs.dirname(project_json)
	end

	local cfg = vim.fs.find(jest_configs, {
		path = vim.fs.dirname(file),
		upward = true,
	})[1]
	if cfg then
		return vim.fs.dirname(cfg)
	end

	return vim.fs.dirname(file)
end

local function read_project_json(path)
	local f = io.open(path, "r")
	if not f then
		return nil
	end
	local content = f:read("*a")
	f:close()

	local ok, parsed = pcall(vim.json.decode, content)
	if not ok then
		return nil
	end
	return parsed
end

function M.jest_config(file)
	local root = M.project_root(file)
	local project_json_path = root .. "/project.json"
	local project = read_project_json(project_json_path)

	if project and project.targets and project.targets.test and project.targets.test.options then
		local jest_config = project.targets.test.options.jestConfig
		if type(jest_config) == "string" and jest_config ~= "" then
			local cfg = vim.fs.normalize(jest_config)
			if vim.startswith(cfg, "/") then
				return cfg
			end
			local workspace = vim.fs.find("nx.json", { path = root, upward = true })[1]
			if workspace then
				return vim.fs.dirname(workspace) .. "/" .. cfg
			end
			return root .. "/" .. cfg
		end
	end

	for _, cfg_name in ipairs(jest_configs) do
		local cfg = root .. "/" .. cfg_name
		if vim.uv.fs_stat(cfg) then
			return cfg
		end
	end

	return nil
end

function M.is_test_file(path)
	return path:match("%.spec%.[jt]sx?$") ~= nil
		or path:match("%.test%.[jt]sx?$") ~= nil
		or path:match("/__tests__/") ~= nil
end

return M
