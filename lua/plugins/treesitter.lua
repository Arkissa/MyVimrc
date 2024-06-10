return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.d2 = {
            install_info = {
                url = 'https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2',
                revision = 'main',
                files = { 'src/parser.c', 'src/scanner.cc' },
            },
            filetype = 'd2',
        };
        require "nvim-treesitter.configs".setup {
            ensure_installed = vim.g.syntax,
            ignore_install = { "" }, -- List of parsers to ignore installing
            highlight = {
                enable = true,       -- false will disable the whole extension
            },
            autopairs = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    node_incremental = '<CR>',
                    node_decremental = '<BS>',
                    scope_incremental = '<TAB>'
                }
            },
        }
    end
}
