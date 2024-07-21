return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    ft = "alpha",
    -- or                              , branch = '0.1.x',
    keys = {
        { "<LEADER>b", "<CMD>Telescope buffers<CR>",     silent = true },
        { "<LEADER>;", "<CMD>Telescope live_grep<CR>",   silent = true },
        { "<LEADER>'", "<CMD>Telescope grep_string<CR>", silent = true },
        { "<LEADER>F", "<CMD>Telescope find_files<CR>",  silent = true },
        { "<LEADER>v", "<CMD>Telescope filetypes<CR>",   silent = true },
    },
    opts = {}
}
