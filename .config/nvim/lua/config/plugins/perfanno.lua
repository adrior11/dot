return {
   "t-troebst/perfanno.nvim",
    cmd = "PerfLuaProfileStart",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local util = require("perfanno.util")
        local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        local bg = string.format("#%06x", hl.bg)
        local fg = require("config.utils.color").colors().diff_remove
        return {
            line_highlights = util.make_bg_highlights(bg, fg, 10),
            vt_highlight = util.make_fg_highlight(fg),
        }
    end,
}
