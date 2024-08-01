return {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set('n', '<leader>[[', function() require("duck").hatch() end, {})
        vim.keymap.set('n', '<leader>[d', function() require("duck").cook() end, {})
        vim.keymap.set('n', '<leader>[dd', function() require("duck").cook_all() end, {})
    end
}
