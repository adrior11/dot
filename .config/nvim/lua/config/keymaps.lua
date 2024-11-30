local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

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

-- Key mappings for splitting windows
vim.keymap.set("n", "<leader>ws", ":split<CR>", opts)
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", opts)

-- Key mappings for window navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", opts)
vim.keymap.set("n", "<leader>wj", "<C-w>j", opts)
vim.keymap.set("n", "<leader>wk", "<C-w>k", opts)
vim.keymap.set("n", "<leader>wl", "<C-w>l", opts)

-- Go back to normal mode in terminal
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>", opts)

-- Shift the current line (< left; > right)
vim.keymap.set("n", "<", "V<<Esc>", opts)
vim.keymap.set("n", ">", "V><Esc>", opts)

-- Toggle relative line
vim.keymap.set("n", "<leader>rl", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, { desc = "Toggle relative line" })
