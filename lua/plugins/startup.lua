return {
    'goolord/alpha-nvim',
    lazy = false,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                                          ",
            "                                                                          ",
            "                                                                        ",
            "       ████ ██████           █████      ██                        ",
            "      ███████████             █████                                ",
            "      █████████ ███████████████████ ███   ███████████      ",
            "     █████████  ███    █████████████ █████ ██████████████      ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████      ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████     ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████    ",
            "                                                                          ",
            "                                                                          ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("ff", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("fw", "  > Find Word", ":Telescope grep_string<CR>"),
            dashboard.button("fr", "󰑑  > Find Word With Regex", ":Telescope live_grep<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("i", "󱩽  > Neorg Index", ":Neorg index<CR>"),
            dashboard.button("u", "󰚰  > Update", ":Lazy update<CR>"),
            dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
            dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
        }
        alpha.setup(dashboard.opts)

        vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end
}
