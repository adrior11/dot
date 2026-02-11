return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		search = {
			pattern = [[\b(KEYWORDS)(\([^)]*\))?\s*:]],
		},
	},
	keys = {
		{
			"<leader>ft",
			function()
				---@diagnostic disable undefined-field
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
	},
	vim.keymap.set("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" }),
	vim.keymap.set("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" }),
}
