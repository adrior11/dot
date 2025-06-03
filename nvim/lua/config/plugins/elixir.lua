return {
	"elixir-editors/vim-elixir",
	ft = { "elixir", "eelixir", "heex", "surface" },
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
