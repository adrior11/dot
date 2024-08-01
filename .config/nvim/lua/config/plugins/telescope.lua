return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "catppuccin/nvim"
    },

    config = function()
        -- local catppuccin = require("catppuccin")

        -- Apply Catppuccin theme to Telescope
        -- catppuccin.setup({
            --flavour = "mocha",
            --integrations = {
                --telescope = true,
            --},
            --color_overrides = {
                --mocha = {
                    --green = "#94e2d5",
                --},
            --},
        --})

        --require("catppuccin").load()

        require('telescope').setup({})

        local builtin = require('telescope.builtin')
	    local keymap = vim.keymap


        keymap.set('n', '<leader>pf', builtin.find_files, {})
        keymap.set('n', '<C-p>', builtin.git_files, {})
        keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        keymap.set('n', '<leader>vh', builtin.help_tags, {})

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

