-- Setup nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local KIND_ICONS = {
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Copilot = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "󰊕",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "󰕳",
	Operator = "",
	Property = "",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "󰊄",
	TypeParameter = "",
	Unit = "",
	Value = "󰫢",
	Variable = "",
}

local has_words_before = function()
	if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

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
			vim_item.kind = string.format("%s %s", KIND_ICONS[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				copilot = "[Copilot]",
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
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp_zsh" },
	}),
})

cmp.event:on("menu_opened", function()
	vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
	vim.b.copilot_suggestion_hidden = false
end)

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})
