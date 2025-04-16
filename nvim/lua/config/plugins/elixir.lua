return {
	"elixir-editors/vim-elixir",
	config = function()
		-- Enables Syntax highlighting for these extensions
		vim.filetype.add({
			extension = {
				heex = "eelixir",
				eex = "eelixir",
				leex = "eelixir",
				sface = "eelixir",
				lexs = "eelixir",
			},
		})
	end,
}
