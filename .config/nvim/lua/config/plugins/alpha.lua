return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        local logo = [[
⠀⠀⣀⣀⡀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⣀⣀⡀⠀⢀⣀⡀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀
⣴⣿⠟⠛⢿⣦⡀⣿⡟⠛⠛⠛⣿⣷⣰⣿⠟⠛⢿⣷⡄⢠⣠⣤⣿⠻⠗⠀⣴⣿⠟⠛⢿⣦⣸⣿⣧⣾⡿⢛⣿⡿⠟⠻⣿⣦⠀
⣿⡇⠀⠀⠀⣿⡇⣿⣷⣄⡀⠀⠉⠁⣿⣇⠀⠀⠀⣿⡇⣀⡉⠻⢿⣶⣄⡰⣿⣇⠀⠀⠀⣿⡿⣿⣿⣅⡀⢸⣿⡀⠀⠀⢸⣿⠀
⠙⠿⣷⣶⣦⣿⡇⠛⠋⠛⢿⣷⣤⡀⠙⠿⣷⣶⡦⣿⡇⢿⣷⣶⣶⣿⣿⣿⠙⠿⣷⣶⡆⣿⡟⠛⠋⠻⢿⣶⣿⣿⣷⣶⣼⣿
        ]]

        dashboard.section.header.type = "group"
        dashboard.section.header.val = {
            { type = "text", val = vim.split(logo, "\n"), opts = { position = "center", hl = "Keyword" } },
            { type = "padding", val = 1 },
            {
                type = "text",
                val = "Wake the fuck up, Samurai! We have a city to burn.",
                opts = { position = "center", shrink_margin = false, hl = "Comment" },
            },
        }

        dashboard.section.buttons.val = {
            dashboard.button("rs", "Last sessions", ":SessionRestore<CR>"),
            dashboard.button("e", "Harpoon", "<cmd>lua require'telescope'.extensions.harpoon.marks()<CR>"),
            dashboard.button("ff", "Find file", ":Telescope find_files<CR>"),
            dashboard.button("fg", "Live grep", "<cmd>FzfLua live_grep<CR>"),
            dashboard.button("ft", "TODO", "<cmd>TodoTelescope<cr>"),
            -- dashboard.button("t", "Terminal", "<cmd>term<cr>"),
            dashboard.button("q", "Quit", ":qa<CR>"),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "Normal"
            button.opts.hl_shortcut = ""
            button.opts.position = "center"
            button.opts.width = 25
        end

        dashboard.section.footer.val = "Welcome to Neovim"
        dashboard.section.footer.opts.hl = "String"
        dashboard.opts.layout[1].val = 8

        return dashboard
    end,

    config = function(_, dashboard)
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        local alpha = require("alpha")
        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local current_hour = tonumber(os.date("%H"))

                local greeting

                if current_hour < 5 then
                    greeting = "      Good night!  "
                elseif current_hour < 12 then
                    greeting = "   󰼰   Good morning!  "
                elseif current_hour < 17 then
                    greeting = "      Good afternoon!   "
                elseif current_hour < 20 then
                    greeting = "   󰖝   Good evening!  "
                else
                    greeting = "   󰖔   Good night!  "
                end

                dashboard.section.footer.val = greeting
                dashboard.section.footer.opts.hl = "Keyword"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
