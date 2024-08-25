return {
    "rcarriga/nvim-notify",
    config = function()
        -- WARN: options missing
        require("notify").setup({
            stages = "fade_in_slide_out",
            timeout = 3000,
            background_colour = "#000000",
            minimum_width = 50,
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
            level = 2,
        })

        -- Set notify as the default notification provider
        vim.notify = require("notify")
    end,
}
