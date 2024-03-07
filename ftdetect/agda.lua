vim.filetype.add {
    extension = {
        agda = function()
            vim.o.filetype = "agda"
        end
    }
}
