require "nvim-web-devicons".set_icon {
    norg = {
        icon = "",
        color = "#4A3A94",
        cterm_color = "65",
        name = "norg"
    }
}

vim.keymap {
    k = "<Leader>\\",
    v = [[<CMD>lua require "nabla".enable_virt {autogen = true, silent = true }<CR>]]
}
