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
					return util.root_pattern("Package.swift", "*.xcodeproj")(fname)
						or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
				end,
				on_attach = function(_, _)
					local function buf_set_option(...) end
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
					vim.keymap.set("n", "<leader>e", function()
						vim.diagnostic.open_float()
					end, { desc = "Open diagnostics float", noremap = true, silent = true })
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_prev()
					end, { desc = "Go to previous diagnostic", noremap = true, silent = true })
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_next()
					end, { desc = "Go to next diagnostic", noremap = true, silent = true })
					vim.keymap.set("n", "<leader>q", function()
						vim.diagnostic.setloclist()
					end, { desc = "Set diagnostics to loclist", noremap = true, silent = true })
				end,
			})
		end,
	},
}
