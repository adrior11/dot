return {
    "rcarriga/nvim-notify",
    config = function()
        -- Configure nvim-notify
        require("notify").setup({
            -- Your configuration settings here
            stages = "fade_in_slide_out",
            timeout = 5000,
            background_colour = "#000000",
            minimum_width = 50,
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
        })

        -- Set notify as the default notification provider
        vim.notify = require("notify")
    end,
}
