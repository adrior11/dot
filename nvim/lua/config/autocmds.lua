vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
	group = "bufcheck",
	pattern = "*",
	command = "startinsert | set winfixheight",
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "bufcheck",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- no autocomment newline
vim.api.nvim_create_autocmd("BufEnter", {
	group = "bufcheck",
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- organize imports (java)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	callback = function()
		vim.lsp.buf.code_action({
			---@diagnostic disable-next-line: missing-fields
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
	end,
})

-- formatting (scala)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.scala",
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Actions",
	callback = function(_)
		vim.keymap.set(
			"n",
			"K",
			vim.lsp.buf.hover,
			{ desc = "Show hover documentation", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float()
		end, { desc = "Open diagnostics float", noremap = true, silent = true })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Go to previous diagnostic", noremap = true, silent = true })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Go to next diagnostic", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>q", function()
			vim.diagnostic.setloclist()
		end, { desc = "Set diagnostics to loclist", noremap = true, silent = true })
	end,
})
