vim.api.nvim_create_augroup("vimrc", {
    clear = false
})

vim.api.nvim_create_autocmd("FileType", {
    group = "vimrc",
    callback = function(_)
        pcall(require, "language." .. vim.o.filetype)
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = "vimrc",
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "vimrc",
    pattern = "*.h",
    command = "setfiletype c"
})
