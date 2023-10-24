return {
    {
        'junegunn/fzf',
        dependencies = {
            'junegunn/fzf.vim',
        },
        keys = {
            { "<LEADER>v", "<CMD>Buffers<CR>", silent = true },
            { "<LEADER>;", "<CMD>Rg<CR>",      silent = true },
            { "<LEADER>F", "<CMD>Files<CR>",   silent = true },
        },
    }
}
