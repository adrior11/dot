return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gruvbox_colors = {
            bg = "#282828", -- bg0_h
            fg = "#ebdbb2", -- fg1
            line_num = "#d65d0e", -- orange
            indent = "#504945", -- bg0
            chunk = "#928374", -- gray
        }

        require("hlchunk").setup({
            chunk = {
                enable = true,
                use_treesitter = true,
                style = {
                    { fg = gruvbox_colors.chunk, bg = gruvbox_colors.bg },
                },
            },
            indent = {
                enable = true,
                style = {
                    { fg = gruvbox_colors.indent, bg = gruvbox_colors.bg },
                },
            },
            blank = {
                enable = false,
            },
            line_num = {
                enable = true,
                style = {
                    { fg = gruvbox_colors.line_num, bg = gruvbox_colors.bg },
                },
            },
        })
    end,
}
