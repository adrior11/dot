return {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,
    config = function()
        vim.keymap.set("n", "<leader>ru", ":RustLsp moveItem up<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rd", ":RustLsp moveItem down<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>re", ":RustLsp explainError current<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rr", ":RustLsp renderDiagnostic current<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rm", ":RustLsp expandMacro<CR>", { noremap = true, silent = true })
    end,
}
