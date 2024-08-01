return {
    "karb94/neoscroll.nvim",
    config = function()
        require('neoscroll').setup({
            -- Set any options you need here
            mappings = {'<C-u>', '<C-d>'},
        })

        -- You can customize the scroll animations here if needed
        local t = {}
        t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
        t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}

        require('neoscroll.config').set_mappings(t)
    end,
}

