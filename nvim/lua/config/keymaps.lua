local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

---@return nil
local function switch_c_header()
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

-- Switch between C source and header files
vim.keymap.set("n", "gh", switch_c_header, { desc = "Switch between .c and .h", noremap = true, silent = true })

-- Copy (line) to system clipboard in normal mode
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')

-- Copy to system clipboard in visual mode
vim.keymap.set("v", "<leader>y", '"+y')

-- Cut (line) to system clipboard in normal mode
vim.keymap.set("n", "<leader>d", '"+d')
vim.keymap.set("n", "<leader>dd", '"+dd')

-- Cut to system clipboard in visual mode
vim.keymap.set("v", "<leader>d", '"+d')

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

-- Paste from system clipboard in before cursor
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')

-- Key mappings for tab management
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tt", ":tabnext<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", opts)
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", opts)

-- Go back to normal mode in terminal
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>", opts)

-- Toggle relative line
vim.keymap.set("n", "<leader>rl", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, { desc = "Toggle relative line" })
