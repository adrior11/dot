return {
    {
        "junegunn/fzf",
        build = "./install --bin"
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
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

            vim.keymap.set("n", "<leader>Ff", "<cmd>FzfLua files<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>Fg", "<cmd>FzfLua live_grep<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>Fb", "<cmd>FzfLua buffers<CR>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>Fh", "<cmd>FzfLua help_tags<CR>", {silent = true, noremap = true})
        end
    }
}
