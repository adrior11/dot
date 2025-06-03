-- Harpoon and Telescope integration
local function toggle_telescope()
	local conf = require("telescope.config").values
	local harpoon_files = require("harpoon"):list()
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Telescope find files",
		},
		{
			"<leader>fa",
			"<cmd>Telescope find_files hidden=true<cr>",
			desc = "Telescope find hidden files",
		},
		{
			"<C-f>",
			"<cmd>Telescope git_files<cr>",
			desc = "Telescope git files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					prompt_title = "Grep >",
					grep_open_files = false,
				})
			end,
			desc = "Telescope live grep",
		},
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Telescope help tags",
		},
		{
			"<C-e>",
			function()
				toggle_telescope()
			end,
			desc = "Open harpoon window",
		},
		{
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			desc = "Telescope todo",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				vertical = {
					mirror = true,
					preview_height = 0.5,
					prompt_position = "top",
				},
			},
		},
	},
}
