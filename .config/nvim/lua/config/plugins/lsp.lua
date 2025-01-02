local opts = { noremap = true, silent = true }

return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.publishDiagnostics = {
				relatedInformation = true,
			}

			lspconfig.sourcekit.setup({
				capabilities = capabilities,
				root_dir = function(fname)
					return util.root_pattern("Package.swift", "*.xcodeproj")(fname) or util.find_git_ancestor(fname)
				end,
				on_attach = function(_, bufnr)
					local function buf_set_option(...)
						vim.api.nvim_set_option_value(bufnr, ...)
					end
					buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP Actions",
				callback = function(_)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
					-- FIX: See :h diagnostic.txt
					-- vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics(), opts)
					-- vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev(), opts)
					-- vim.keymap.set('n', ']d', vim.lsp.diagnostic.jump({count=1, float=true}), opts)
					-- vim.keymap.set('n', '<leader>q', vim.lsp.diagnostic.set_loclist(), opts)
					-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting(), opts)
				end,
			})
		end,
	},
}
