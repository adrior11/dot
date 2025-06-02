return {
	"S1M0N38/love2d.nvim",
	ft = "lua",
	opts = {
		path_to_love_bin = "/Users/schneiderad/Developer/Projects/Other/love/platform/xcode/build/Release/love.app/Contents/MacOS/love",
		restart_on_save = false,
		debug_window_opts = nil,
	},
	keys = {
		{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
		{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
	},
}
