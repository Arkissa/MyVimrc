return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require "nvim-treesitter.configs".setup {
            ensure_installed = vim.g.syntax,
            highlight = {
                enable = true, -- false will disable the whole extension
            },
            autopairs = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }
    end
}
