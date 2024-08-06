return {
    "karb94/neoscroll.nvim",
    config = function()
        require('neoscroll').setup({
            mappings = {'<C-u>', '<C-d>'},
        })

        -- Customize the scroll animations here 
        local t = {}
        t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
        t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}

        require('neoscroll.config').set_mappings(t)
    end,
}

