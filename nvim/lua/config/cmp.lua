-- Setup nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

local kind_icons = {
	Text = "󰊄",
	Method = "",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "󰕳",
	Property = "",
	Unit = "",
	Value = "󰫢",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		expandable_indicator = true,
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

-- Setup configuration for specific filetypes
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	capabilities = capabilities,
})
lspconfig.elixirls.setup({
	capabilities = capabilities,
})
-- lspconfig.clangd.setup {
--     capabilities = capabilities,
-- }
lspconfig.jsonls.setup({
	capabilities = capabilities,
})
lspconfig.jdtls.setup({
	capabilities = capabilities,
})
lspconfig.texlab.setup({
	capabilities = capabilities,
})
lspconfig.zls.setup({
	capabilities = capabilities,
})
-- lspconfig.hls.setup {
--     capabilities = capabilities,
-- }
lspconfig.marksman.setup({
	capabilities = capabilities,
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})
lspconfig.sqlls.setup({
	capabilities = capabilities,
})
