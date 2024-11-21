return {
    "karb94/neoscroll.nvim",
    keys = { '<C-u>', '<C-d>' },
    config = function()
        require('neoscroll').setup({
            mappings = {
                '<C-u>', '<C-d>'
            },
        })
    end,
}

