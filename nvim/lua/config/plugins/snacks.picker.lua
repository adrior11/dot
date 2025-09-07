local function open_harpoon_picker()
	local harpoon = require("harpoon")
	local list = harpoon:list()

	if #list.items == 0 then
		vim.notify("Harpoon list is empty", vim.log.levels.INFO)
		return
	end

	local items, longest = {}, 0
	for i, entry in ipairs(list.items) do
		local rel = entry.value
		local abs = vim.fn.fnamemodify(rel, ":p")
		local base = vim.fn.fnamemodify(abs, ":t")
		longest = math.max(longest, #base)

		items[#items + 1] = {
			idx = i,
			text = rel,
			name = base,
			file = abs,
			score = 1000 - i,
		}
	end
	longest = longest + 2

	Snacks.picker({
		title = "Harpoon",
		items = items,

		confirm = function(picker, item)
			picker:close()
			require("harpoon"):list():select(item.idx)
		end,
	})
end

return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		picker = {
			prompt = " ",
			sources = {},
			focus = "input",
			layout = {
				cycle = true,
				preset = function()
					return vim.o.columns >= 120 and "default" or "vertical"
				end,
			},
			matcher = {
				fuzzy = true,
				smartcase = true,
				ignorecase = true,
				sort_empty = false,
				filename_bonus = true,
				file_pos = true,
				cwd_bonus = false,
				frecency = true,
				history_bonus = false,
			},
			sort = {
				fields = { "score:desc", "#text", "idx" },
			},
			ui_select = true, -- replace `vim.ui.select` with the snacks picker
			formatters = {
				text = {
					ft = nil, -- filetype for highlighting
				},
				file = {
					filename_first = true,
					truncate = 1000,
					filename_only = false,
					icon_width = 2,
					git_status_hl = true,
				},
				selected = {
					show_always = false,
					unselected = true,
				},
				severity = {
					icons = true,
					level = false,
					pos = "left",
				},
			},
			previewers = {
				diff = {
					builtin = true,
					cmd = { "delta" },
				},
				git = {
					builtin = true,
					args = {},
				},
				file = {
					max_size = 1024 * 1024,
					max_line_length = 500,
					ft = nil,
				},
				man_pager = nil,
			},
			jump = {
				jumplist = true,
				tagstack = false,
				reuse_win = false,
				close = true,
				match = false,
			},
			toggles = {
				follow = "f",
				hidden = "h",
				ignored = "i",
				modified = "m",
				regex = { icon = "R", value = false },
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["/"] = "toggle_focus",
						["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
						["<C-Up>"] = { "history_back", mode = { "i", "n" } },
						["<C-c>"] = { "cancel", mode = "i" },
						["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
						["<CR>"] = { "confirm", mode = { "n", "i" } },
						["<Down>"] = { "list_down", mode = { "i", "n" } },
						["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
						["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
						["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
						["<Up>"] = { "list_up", mode = { "i", "n" } },
						["<a-d>"] = { "inspect", mode = { "n", "i" } },
						["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
						["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
						["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
						["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
						["<c-a>"] = { "select_all", mode = { "n", "i" } },
						["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
						["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
						["<c-j>"] = { "list_down", mode = { "i", "n" } },
						["<c-k>"] = { "list_up", mode = { "i", "n" } },
						["<c-n>"] = { "list_down", mode = { "i", "n" } },
						["<c-p>"] = { "list_up", mode = { "i", "n" } },
						["<c-q>"] = { "qflist", mode = { "i", "n" } },
						["<c-s>"] = { "edit_split", mode = { "i", "n" } },
						["<c-t>"] = { "tab", mode = { "n", "i" } },
						["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
						["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
						["<c-r>#"] = { "insert_alt", mode = "i" },
						["<c-r>%"] = { "insert_filename", mode = "i" },
						["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
						["<c-r><c-f>"] = { "insert_file", mode = "i" },
						["<c-r><c-l>"] = { "insert_line", mode = "i" },
						["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
						["<c-r><c-w>"] = { "insert_cword", mode = "i" },
						["<c-w>H"] = "layout_left",
						["<c-w>J"] = "layout_bottom",
						["<c-w>K"] = "layout_top",
						["<c-w>L"] = "layout_right",
						["?"] = "toggle_help_input",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["j"] = "list_down",
						["k"] = "list_up",
						["q"] = "close",
					},
					b = {
						minipairs_disable = true,
					},
				},
				list = {
					keys = {
						["/"] = "toggle_focus",
						["<2-LeftMouse>"] = "confirm",
						["<CR>"] = "confirm",
						["<Down>"] = "list_down",
						["<Esc>"] = "cancel",
						["<S-CR>"] = { { "pick_win", "jump" } },
						["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
						["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
						["<Up>"] = "list_up",
						["<a-d>"] = "inspect",
						["<a-f>"] = "toggle_follow",
						["<a-h>"] = "toggle_hidden",
						["<a-i>"] = "toggle_ignored",
						["<a-m>"] = "toggle_maximize",
						["<a-p>"] = "toggle_preview",
						["<a-w>"] = "cycle_win",
						["<c-a>"] = "select_all",
						["<c-b>"] = "preview_scroll_up",
						["<c-d>"] = "list_scroll_down",
						["<c-f>"] = "preview_scroll_down",
						["<c-j>"] = "list_down",
						["<c-k>"] = "list_up",
						["<c-n>"] = "list_down",
						["<c-p>"] = "list_up",
						["<c-q>"] = "qflist",
						["<c-s>"] = "edit_split",
						["<c-t>"] = "tab",
						["<c-u>"] = "list_scroll_up",
						["<c-v>"] = "edit_vsplit",
						["<c-w>H"] = "layout_left",
						["<c-w>J"] = "layout_bottom",
						["<c-w>K"] = "layout_top",
						["<c-w>L"] = "layout_right",
						["?"] = "toggle_help_list",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["i"] = "focus_input",
						["j"] = "list_down",
						["k"] = "list_up",
						["q"] = "close",
						["zb"] = "list_scroll_bottom",
						["zt"] = "list_scroll_top",
						["zz"] = "list_scroll_center",
					},
					wo = {
						conceallevel = 2,
						concealcursor = "nvc",
					},
				},
				preview = {
					keys = {
						["<Esc>"] = "cancel",
						["q"] = "close",
						["i"] = "focus_input",
						["<a-w>"] = "cycle_win",
					},
				},
			},
			icons = {
				files = {
					enabled = true,
					dir = "󰉋 ",
					dir_open = "󰝰 ",
					file = "󰈔 ",
				},
				keymaps = {
					nowait = "󰓅 ",
				},
				tree = {
					vertical = "│ ",
					middle = "├╴",
					last = "└╴",
				},
				undo = {
					saved = " ",
				},
				ui = {
					live = "󰐰 ",
					hidden = "h",
					ignored = "i",
					follow = "f",
					selected = "● ",
					unselected = "○ ",
					-- selected = " ",
				},
				git = {
					enabled = true,
					commit = "󰜘 ",
					staged = "●",
					added = "",
					deleted = "",
					ignored = " ",
					modified = "○",
					renamed = "",
					unmerged = " ",
					untracked = "?",
				},
				diagnostics = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				},
				lsp = {
					unavailable = "",
					enabled = " ",
					disabled = " ",
					attached = "󰖩 ",
				},
				kinds = {
					Array = " ",
					Boolean = "󰨙 ",
					Class = " ",
					Color = " ",
					Control = " ",
					Collapsed = " ",
					Constant = "󰏿 ",
					Constructor = " ",
					Copilot = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = " ",
					Function = "󰊕 ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = "󰊕 ",
					Module = " ",
					Namespace = "󰦮 ",
					Null = " ",
					Number = "󰎠 ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = "󱄽 ",
					String = " ",
					Struct = "󰆼 ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Unknown = " ",
					Value = " ",
					Variable = "󰀫 ",
				},
			},
			db = {
				sqlite3_path = nil,
			},
			debug = {
				scores = true,
				leaks = false,
				explorer = false,
				files = false,
				grep = false,
				proc = false,
				extmarks = false,
			},
		},
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>;",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		-- find & grep
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fp",
			function()
				open_harpoon_picker()
			end,
			desc = "Harpoon",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- LazyGit
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "LaztyGit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "LaztyGit Log",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "LaztyGit log file",
		},
	},
}
