return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        mirror = true,
                        preview_height = 0.5,
                        prompt_position = 'top',
                    },
                },
            },
        })

        local builtin = require('telescope.builtin')
	    local keymap = vim.keymap

        keymap.set('n', '<leader>ff', builtin.find_files, {})
        keymap.set('n', '<C-f>', builtin.git_files, {})
        keymap.set('n', '<leader>fg', function()
            builtin.live_grep({
                prompt_title = 'Grep >',
                grep_open_files = false
            })
        end)
        keymap.set('n', '<leader>fn', ':Telescope notify<CR>')
        keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- Harpoon and Telescope integration
        local harpoon = require('harpoon')
        harpoon:setup({})

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
    end
}

