return {
   "t-troebst/perfanno.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local util = require("perfanno.util")
        local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        local bg = string.format("#%06x", hl.bg)
        local fg = "#fb4934"
        return {
            line_highlights = util.make_bg_highlights(bg, fg, 10),
            vt_highlight = util.make_fg_highlight(fg),
        }
    end,
    cmd = "PerfLuaProfileStart",
}
