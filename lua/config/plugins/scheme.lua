return {
    "catppuccin/nvim",
    lazy = false,
    config = function()
        require "catppuccin".setup {
            flavour = "macchiato",      -- latte, frappe, macchiato, mocha
            transparent_background = false,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false,   -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = { "bold" },
                functions = { "italic" },
                keywords = { "bold" },
                strings = { "italic" },
                variables = { "bold" },
                numbers = { "bold" },
                booleans = { "italic" },
                properties = {},
                types = { "bold" },
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                cmp = true,
                notify = true,
                neotree = true,
                illuminate = true,
            },
        }
        vim.cmd.colorscheme "catppuccin"
    end
}
