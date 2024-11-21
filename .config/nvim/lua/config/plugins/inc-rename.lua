return {
    "smjonas/inc-rename.nvim",
    keys = {
        {
            "<leader>rn",
            function ()
                vim.api.nvim_feedkeys(
                    ":IncRename ",
                    "n",
                    false
                )
            end,
            desc = "IncRename",
        },
        {
            "<leader>rN",
            function ()
                vim.api.nvim_feedkeys(
                    ":IncRename " .. vim.fn.expand("<cword>"),
                    "n",
                    false
                )
            end,
            desc = "IncRename",
        },
    },
    opts = {},
}
