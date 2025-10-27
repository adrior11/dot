local M = {}

--- Switch between C source and header files.
---@return nil
function M.switch_c_header()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		return -- no name; just bail out
	end

	-- Decide which counterpart we need
	local target
	if file:match("%.c$") then
		target = file:gsub("%.c$", ".h")
	elseif file:match("%.h$") then
		target = file:gsub("%.h$", ".c")
	else
		Snacks.notify("Not a .c or .h file", { level = "info", title = "Source ↔ Header" })
		return
	end

	-- Jump if it exists
	if vim.fn.filereadable(target) == 1 then
		vim.cmd.edit(vim.fn.fnameescape(target))
	else
		Snacks.notify(
			{ "No matching file found:", vim.fn.fnamemodify(target, ":~:.") },
			{ level = "warn", title = "Source ↔ Header" }
		)
	end
end

--- Copy the current buffer's file path to the system clipboard.
---@return nil
function M.copy_buffer_path_to_clipboard()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		Snacks.notify("Buffer has no name", { level = "warn", title = "Copy Path" })
		return
	end
	vim.fn.setreg("+", file)
	Snacks.notify("Copied to clipboard: " .. vim.fn.fnamemodify(file, ":~:."), { level = "info", title = "Copy Path" })
end

return M
