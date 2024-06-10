return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        shade_terminals = false
    },
    keys = {
        { "sg", "<CMD>ToggleTerm<CR>",                                                                                              silent = true },
        { "s;", ":lua require 'toggleterm.terminal'.Terminal:new {cmd='lazygit', hidden = true,direction = 'float',}:toggle()<CR>", silent = true }
        -- { "<LEADER>;", "<CMD>Telescope live_grep<CR>",  silent = true },
        -- { "<LEADER>F", "<CMD>Telescope find_files<CR>", silent = true },
        -- { "<LEADER>v", "<CMD>Telescope filetypes<CR>",  silent = true },
    },
}
