return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
        require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }

        -- Key mappings
        vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>",
          {silent = true, noremap = true}
        )
        vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>",
          {silent = true, noremap = true}
        )
    end
}
