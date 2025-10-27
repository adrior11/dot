--- Determine the path to the LÖVE binary.
--- Use a custom build if it exists; otherwise, default to `love`.
---@return string
local function get_love_bin()
	local bin =
		vim.fn.expand("$HOME/Developer/Projects/Other/love/platform/xcode/build/Release/love.app/Contents/MacOS/love")
	return (vim.fn.filereadable(bin) == 1 and bin) or "love"
end

return {
	"S1M0N38/love2d.nvim",
	ft = "lua",
	opts = {
		path_to_love_bin = get_love_bin(),
		restart_on_save = false,
		debug_window_opts = nil,
	},
	keys = {
		{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
		{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
	},
}
