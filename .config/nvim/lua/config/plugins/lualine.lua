local color_util = require("config.utils.color")

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "folke/noice.nvim",
        "letieu/harpoon-lualine",
        "kyazdani42/nvim-web-devicons"
    },
    config = function()
        -- NOTE: Move this to config.utils.color
        local gruvbox_colors = {
            fg = "#ebdbb2", -- light1
            bg = "#282828", -- dark0
            section_bg = "#3c3836", -- dark1
            mode_base = "#1d2021", -- dark0_hard
            mode_n = "#458588", -- neutral_blue
            mode_i = "#98971a", -- neutral_green
            mode_v = "#d79921", -- neutral_yellow
            mode_r = "#cc241d", -- neutral_red
            mode_c = "#b16286", -- neutral_purple
            branch_fg = "#ebdbb2", -- neutral_green
            branch_bg = "#3c3836", -- dark0
            diff_add = "#b8bb26", -- bright_green
            diff_change = "#fabd2f", -- bright_yellow
            diff_remove = "#fb4934", -- bright_red
        }

        local custom_branch = {
            "branch",
            icon = "",
            color = { fg = gruvbox_colors.branch_fg, bg = gruvbox_colors.branch_bg },
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = {
                    normal = {
                        a = { fg = gruvbox_colors.mode_base, bg = gruvbox_colors.mode_n },
                        b = { fg = gruvbox_colors.fg, bg = gruvbox_colors.section_bg },
                        c = { fg = gruvbox_colors.fg, bg = gruvbox_colors.bg },
                    },
                    insert = { a = { fg = gruvbox_colors.mode_base, bg = gruvbox_colors.mode_i } },
                    visual = { a = { fg = gruvbox_colors.mode_base, bg = gruvbox_colors.mode_v } },
                    replace = { a = { fg = gruvbox_colors.mode_base, bg = gruvbox_colors.mode_r } },
                    command = { a = { fg = gruvbox_colors.mode_base, bg = gruvbox_colors.mode_c } },
                    inactive = {
                        a = { fg = gruvbox_colors.fg, bg = gruvbox_colors.bg },
                        b = { fg = gruvbox_colors.fg, bg = gruvbox_colors.bg },
                        c = { fg = gruvbox_colors.fg, bg = gruvbox_colors.bg },
                    },
                },
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                component_separators = { left = '', right = '' }, -- No separators
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { custom_branch, "diff", "diagnostics" },
                lualine_c = {
                    '%=', -- make the indicator center
                    {
                        "harpoon2",
                        indicators = { "h", "j", "k", "l" },
                        active_indicators = { "[H]", "[J]", "[K]", "[L]" },
                        _seperator = " ",
                        no_harpoon = "Harpoon not hooked",
                    },
                    -- { "filename", file_status = true, path = 1 },
                },
                lualine_x = {
                    {
                        function()
                            return require("noice").api.status.command.get()
                        end,
                        cond = function()
                            return require("noice").api.status.command.has()
                        end,
                        color = color_util.fg("Comment"),
                    },
                    {
                        function()
                            return require("noice").api.status.mode.get()
                        end,
                        cond = function()
                            return require("noice").api.status.mode.has()
                        end,
                        color = color_util.fg("Constant"),
                    },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
