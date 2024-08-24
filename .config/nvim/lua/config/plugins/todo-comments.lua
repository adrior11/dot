return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
        require("todo-comments").setup {}

        -- Key mappings
        vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>",
            {silent = true, noremap = true}
        )
       vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>",
            {silent = true, noremap = true}
        )
        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" })
    end
}
