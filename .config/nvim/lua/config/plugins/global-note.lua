return {
    "backdround/global-note.nvim",
    config = function()
        local global_note = require("global-note")
        global_note.setup({
            filename = "global.md",  -- Default note filename
            directory = vim.fn.stdpath("data") .. "/global-note/",  -- Directory to store the notes
            title = "Global note",  -- Floating window title
            command_name = "GlobalNote",  -- Ex command to open the note
            window_config = function()
                local window_height = vim.api.nvim_list_uis()[1].height
                local window_width = vim.api.nvim_list_uis()[1].width
                return {
                    relative = "editor",
                    border = "single",
                    title = "Note",
                    title_pos = "center",
                    width = math.floor(0.7 * window_width),
                    height = math.floor(0.85 * window_height),
                    row = math.floor(0.05 * window_height),
                    col = math.floor(0.15 * window_width),
                }
            end,
            post_open = function(_, _) end,
            autosave = true,  -- Enable autosave
            additional_presets = {
                -- food = {
                --     filename = "want-to-eat.md",
                --     title = "List of food",
                --     command_name = "FoodNote",
                -- },
            },
        })

        -- Key mappings
        vim.keymap.set("n", "<leader>n", global_note.toggle_note, { desc = "Toggle global note" })
    end,
}

