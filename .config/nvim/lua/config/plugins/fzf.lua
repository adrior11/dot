local colors = require("config.utils.color").colors()

return {
	{
		"junegunn/fzf",
		keys = { "<leader>Ff", "<leader>Fg", "<leader>Fb", "<leader>Fh" },
		build = "./install --bin",
	},
	{
		"ibhagwan/fzf-lua",
		keys = { "<leader>Ff", "<leader>Fg", "<leader>Fb", "<leader>Fh" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					hl = {
						normal = "GruvboxBg1",
						border = "GruvboxBg2",
					},
				},
				fzf_opts = {
					["--color"] = table.concat({
						"bg:" .. colors.dark0,
						"fg:" .. colors.light1,
						"hl:" .. colors.bright_green,
						"fg+:" .. colors.light1,
						"bg+:" .. colors.dark1,
						"hl+:" .. colors.bright_yellow,
						"info:" .. colors.bright_orange,
						"prompt:" .. colors.bright_orange,
						"pointer:" .. colors.bright_orange,
						"marker:" .. colors.bright_red,
						"spinner:" .. colors.bright_purple,
						"header:" .. colors.bright_aqua,
					}, ","),
				},
			})

			vim.keymap.set(
				"n",
				"<leader>Ff",
				"<cmd>FzfLua files<CR>",
				{ silent = true, noremap = true, desc = "Fzf files" }
			)
			vim.keymap.set(
				"n",
				"<leader>Fg",
				"<cmd>FzfLua live_grep<CR>",
				{ silent = true, noremap = true, desc = " Fzf live grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>Fb",
				"<cmd>FzfLua buffers<CR>",
				{ silent = true, noremap = true, desc = "Fzf buffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>Fh",
				"<cmd>FzfLua help_tags<CR>",
				{ silent = true, noremap = true, desc = "Fzf help tags" }
			)
		end,
	},
}
