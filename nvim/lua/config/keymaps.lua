local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

-- Open index.html in browser
vim.keymap.set("n", "<leader>gs", function()
	local file = vim.fn.expand("%:t")
	if file == "index.html" then
		local path = vim.fn.expand("%:p")
		vim.fn.system({ "open", path })
	else
		print("Current file is not index.html")
	end
end, { desc = "Open index.html in browser" })
