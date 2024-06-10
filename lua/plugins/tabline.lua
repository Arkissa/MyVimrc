return {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "*",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, _, _)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            -- indicator = {
            --     icon = '█', -- this should be omitted if indicator style is not 'icon'
            --     style = "icon",
            -- },
            offsets = {
                {
                    filetype = "neo-tree",
                    text = " File Explorer",
                    text_align = "center",
                    highlight = "Directory",
                    separator = true
                }
            },
            color_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            tab_size = 25,
            padding = 0,
        },
        highlights = {
            tab_separator_selected = {
                bg = "#8AADF5",
                underline = true,
            }
        }
    },
    config = true
}
