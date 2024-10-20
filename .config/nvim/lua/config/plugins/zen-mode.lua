return {
    "folke/zen-mode.nvim",
    keys = { '<leader>zz' },
    cmd = 'ZenMode',
    config = function()
        require("zen-mode").setup {}

        -- Example key mapping to toggle Zen Mode
        vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", {silent = true, noremap = true})
    end
}
