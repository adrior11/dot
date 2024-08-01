return {
    {
        "junegunn/fzf",
        build = "./install --bin"
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
        config = function()
            require("fzf-lua").setup({
                winopts = {
                    -- Set the colors for the window
                    hl = {
                        normal = "GruvboxBg1",
                        border = "GruvboxBg2",
                    },
                },
                fzf_opts = {
                    -- Set the colors for the fzf interface
                    ["--color"] = "bg:#282828,fg:#ebdbb2,hl:#b8bb26,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f,info:#fe8019,prompt:#fe8019,pointer:#fe8019,marker:#fb4934,spinner:#d3869b,header:#8ec07c",
                },
            })

            -- Example key mappings
            vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", {silent = true, noremap = true})
        end
    }
}
