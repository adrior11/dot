return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
        require("todo-comments").setup {}

        -- Key mappings
        vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>",
          {silent = true, noremap = true}
        )
        vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>",
          {silent = true, noremap = true}
        )
    end
}
