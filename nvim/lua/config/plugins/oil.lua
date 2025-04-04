return {
	"stevearc/oil.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		default_file_explorer = true,

		columns = {
			"icon",
			"size",
		},

		delete_to_trash = true,
		skip_confirm_for_simple_edits = false,
		prompt_save_on_select_new_entry = true,
		watch_for_changes = true,

		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
			["<C-v>"] = {
				"actions.select",
				opts = { horizontal = true },
				desc = "Open the entry in a horizontal split",
			},
			["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-a>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},

		use_default_keymaps = false,

		view_options = {
			show_hidden = true,

			is_hidden_file = function(name, _)
				return vim.startswith(name, ".")
			end,

			is_always_hidden = function(_, _)
				return false
			end,

			natural_order = true,
		},
	},

	-- Global keymap to open Oil
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
