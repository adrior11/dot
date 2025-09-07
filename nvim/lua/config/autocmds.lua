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

-- organize imports (java, scala)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.java", "*.scala" },
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

-- enforce tree-sitter for tsx/jsx files
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*.tsx", "*.jsx" },
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local ok, parsers = pcall(require, "nvim-treesitter.parsers")
		if not ok then
			return
		end
		local lang = parsers.ft_to_lang(ft)
		pcall(vim.treesitter.start, args.buf, lang)
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

		-- map("n", "<leader>cl", vim.lsp.codelens.run)
		-- map("n", "<leader>sh", vim.lsp.buf.signature_help)
		-- map("n", "<leader>rn", vim.lsp.buf.rename)
		-- map("n", "<leader>f", vim.lsp.buf.format)
		-- map("n", "<leader>ca", vim.lsp.buf.code_action)
		-- -- all workspace diagnostics
		-- map("n", "<leader>aa", vim.diagnostic.setqflist)
		-- -- all workspace errors
		-- map("n", "<leader>ae", function()
		--   vim.diagnostic.setqflist({ severity = "E" })
		-- end)
		-- -- all workspace warnings
		-- map("n", "<leader>aw", function()
		--   vim.diagnostic.setqflist({ severity = "W" })
		-- end)
	end,
})
