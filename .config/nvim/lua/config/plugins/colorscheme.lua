local colors = require('config.utils.color').colors();

return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            contrast = "hard",
            overrides = {
                SignColumn = {bg = colors.dark0 },
                Normal = { bg = colors.dark0 },
            },
            transparent_mode = false,
        })

        vim.cmd.colorscheme("gruvbox")
    end,
}

