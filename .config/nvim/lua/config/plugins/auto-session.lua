return {
    {
        'rmagatti/auto-session',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('auto-session').setup({
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

                session_lens = {
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                },
            })

            vim.keymap.set('n', '<leader>q', ':SessionSave<CR>', { silent = true, noremap = true })
            vim.keymap.set('n', '<C-s>', require("auto-session.session-lens").search_session, {
                noremap = true,
            })
        end,
    },
}
