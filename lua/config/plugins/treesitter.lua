return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local status_ok, configs = pcall(require, "nvim-treesitter.configs")
            if not status_ok then return end

            configs.setup({
                ensure_installed = {
                    "python",
                    "go",
                    "c",
                    "lua",
                    "cpp",
                    "bash",
                    "json",
                    "regex",
                    "toml",
                    "vim",
                    "yaml",
                    "proto",
                    "html",
                    "sql",
                    "haskell",
                    "haskell_persistent",
                    "java",
                    "markdown",
                    "markdown_inline",
                },                       -- one of "all" or a list of languages
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
            })

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        end
    },
}
