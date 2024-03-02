return {
    {
        'junegunn/fzf',
        dependencies = {
            'junegunn/fzf.vim',
        },
        keys = {
            { "<LEADER>b", "<CMD>Buffers<CR>",   silent = true },
            { "<LEADER>;", "<CMD>Rg<CR>",        silent = true },
            { "<LEADER>F", "<CMD>Files<CR>",     silent = true },
            { "<LEADER>v", "<CMD>Filetypes<CR>", silent = true },
        },
    }
}
