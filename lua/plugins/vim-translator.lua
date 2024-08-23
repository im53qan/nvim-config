return {
    "voldikss/vim-translator",
    version = "*",
    config = function()
        vim.api.nvim_set_keymap('n', '<C-c>', ':TranslateW<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('v', '<C-c>', ':TranslateW<CR>', { noremap = true, silent = true })
    end
}
