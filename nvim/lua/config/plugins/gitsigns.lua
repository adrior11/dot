return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 100,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = " <author>, <author_time:%R> • <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, { desc = "Next hunk" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end, { desc = "Previous hunk" })

			-- Actions
			map({ "n", "v" }, "<leader>hu", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns stage hunk" })
			map({ "n", "v" }, "<leader>ho", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
			map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
			map("n", "<leader>hU", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
			map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
			map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
			map("n", "<leader>hP", gs.preview_hunk_inline, { desc = "Gitsigns preview hunk inline" })
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, { desc = "Gitsigns blame line" })
			map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns toggle current blame line" })
			map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Gitsigns toggle word diff" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	},
}
