local M = {
	--- Internal cache of last dap arguments provided,
	--- ensuring persistence across `run_last()` invocations.
	--- @type string[]|nil
	_cached_args = nil,
}

--- Prompt for arguments and set the cache.
---@private
---@param prompt? string
---@return string[]
function M.prompt_and_set(prompt)
	local line = vim.fn.input(prompt or "Arguments: ")
	local args = vim.fn.split(line, " ")
	M._cached_args = args
	return args
end

--- Get cached arguments or prompt for them.
---@param prompt? string
---@return string[]
function M.get_or_prompt(prompt)
	local args = M._cached_args
	if args and #args > 0 then
		-- return a copy so it can't be mutated downstream
		return vim.deepcopy(args)
	end
	return M.prompt_and_set(prompt)
end

--- Clear the argument cache.
---@return nil
function M.clear_cache()
	M._cached_args = nil
end

return M
