vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0, "n", "<Leader>r",
            ":w<CR>:!gcc -Wshadow -Wall -Werror -o %:t:r.out % -g  && time ./%:t:r.out<CR>",
            { noremap = true, silent = true }
        )
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0, "n", "<Leader>r",
            ":w<CR>:!g++ -Wshadow -Wall -Werror -o %:t:r.out % -g  && time ./%:t:r.out<CR>",
            { noremap = true, silent = true }
        )
    end
})
