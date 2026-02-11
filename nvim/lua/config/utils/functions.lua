local M = {}

--- Switch between C/C++ source and header files.
---@return nil
function M.switch_c_header()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		return -- no name; just bail out
	end

	local source_exts = { "c", "cpp", "cc", "cxx" }
	local header_exts = { "h", "hpp", "hh", "hxx" }

	-- Extract the file extension
	local ext = file:match("%.([%w]+)$")
	if not ext then
		Snacks.notify("No file extension", { level = "info", title = "Source ↔ Header" })
		return
	end

	local function contains(list, x)
		for _, v in ipairs(list) do
			if v == x then
				return true
			end
		end
		return false
	end

	local base = file:gsub("%.[%w]+$", "")
	local candidates = {}

	if contains(source_exts, ext) then
		for _, h in ipairs(header_exts) do
			table.insert(candidates, base .. "." .. h)
		end
	elseif contains(header_exts, ext) then
		for _, s in ipairs(source_exts) do
			table.insert(candidates, base .. "." .. s)
		end
	else
		Snacks.notify(
			{ "Not a C/C++ source or header file:", vim.fn.fnamemodify(file, ":~:.") },
			{ level = "info", title = "Source ↔ Header" }
		)
		return
	end

	for _, target in ipairs(candidates) do
		if vim.fn.filereadable(target) == 1 then
			vim.cmd.edit(vim.fn.fnameescape(target))
			return
		end
	end

	Snacks.notify(
		{ "No matching file found:", vim.fn.fnamemodify(candidates[1], ":~:.") },
		{ level = "warn", title = "Source ↔ Header" }
	)
end

--- Copy the current buffer's file path to the system clipboard.
---@return nil
function M.copy_buffer_path_to_clipboard()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		Snacks.notify("Buffer has no name", { level = "warn", title = "Copy Path" })
		return
	end

	local rel = vim.fn.fnamemodify(file, ":.")
	vim.fn.setreg("+", rel)

	Snacks.notify("Copied '" .. rel .. "' to the clipboard.", { level = "info", title = "Copy Path" })
end

return M
