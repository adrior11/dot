return {
	"numToStr/Comment.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
	},
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
	keys = { "gcc", "gbc" },
}
