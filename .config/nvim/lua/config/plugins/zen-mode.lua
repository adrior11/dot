return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        }

        -- Example key mapping to toggle Zen Mode
        vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", {silent = true, noremap = true})
    end
}
