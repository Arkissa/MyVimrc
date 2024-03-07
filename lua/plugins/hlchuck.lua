return {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter *.go,*.lua,*.rs,*.java,*.sh,*.json,*.c,*.cpp,*.mod,*.py",
    config = function()
        require 'hlchunk'.setup {
            indent = {
                chars = { "│", "¦", "┆", "┊", },
                style = {
                    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                },
            },
            chunk = {
                notify = false,
                style = "#B6BCF7",
            },
            line_num = {
                style = "#B6BCF7",
            },
            blank = {
                enable = false,
            }
        }
    end
}
