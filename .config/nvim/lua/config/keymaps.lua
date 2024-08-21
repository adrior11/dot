vim.g.mapleader = " "

-- return to file structure
-- vim.keymap.set("n", "<leader>[v", vim.cmd.Ex)
vim.keymap.set("n", "<leader>[v", "<CMD>Oil<CR>")

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
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tt", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })

-- Key mappings for splitting windows
vim.keymap.set('n', '<leader>ws', ':split<CR>', { silent = true, noremap = true })  -- Horizontal split
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true, noremap = true }) -- Vertical split

-- Key mappings for window navigation
vim.keymap.set('n', '<leader>wh', '<C-w>h', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { silent = true, noremap = true })

-- Create a new line below the current line and go back to normal mode
vim.keymap.set('n', '<leader>o', function()
  vim.cmd('normal! o')
end, { noremap = true, silent = true })

-- Create a new line above the current line and go back to normal mode
vim.keymap.set('n', '<leader>O', function()
  vim.cmd('normal! O')
end, { noremap = true, silent = true })

-- Open Copilot panel
vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true, silent = true })
