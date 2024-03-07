return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require "nvim-treesitter.configs".setup {
            ensure_installed = _G.ENV.syntax,
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
