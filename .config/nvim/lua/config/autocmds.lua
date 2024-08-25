vim.api.nvim_create_augroup('bufcheck', {clear = true})

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
    group = 'bufcheck',
    pattern = '*',
    command = 'startinsert | set winfixheight'
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'bufcheck',
    pattern = '*',
    callback = function() vim.highlight.on_yank{timeout=200} end
})

-- no autocomment newline 
vim.api.nvim_create_autocmd('BufEnter', {
    group = 'bufcheck',
    pattern = '*',
    command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

