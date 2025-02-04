return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- Initialize harpoon
			harpoon:setup()

			-- Key mappings
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon add" })
			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon 1" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon 2" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon 3" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon 4" })

			-- Reset Harpoon marks
			vim.keymap.set("n", "<leader>hr", function()
				harpoon:list():clear()
				print("Harpoon hooks cleared!")
			end, { desc = "Harpoon reset" })
		end,
	},
	{
		"letieu/harpoon-lualine",
		lazy = true,
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},
}
