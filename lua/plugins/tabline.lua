-- return {
--     'akinsho/bufferline.nvim',
--     lazy = false,
--     version = "*",
--     opts = {
--         options = {
--             diagnostics = "nvim_lsp",
--             diagnostics_indicator = function(count, level, _, _)
--                 local icon = level:match("error") and " " or " "
--                 return " " .. icon .. count
--             end,
--             -- indicator = {
--             --     icon = '█', -- this should be omitted if indicator style is not 'icon'
--             --     style = "icon",
--             -- },
--             offsets = {
--                 {
--                     filetype = "neo-tree",
--                     text = " File Explorer",
--                     text_align = "center",
--                     highlight = "Directory",
--                     separator = true
--                 }
--             },
--             color_icons = true,
--             show_buffer_close_icons = true,
--             show_close_icon = true,
--             tab_size = 25,
--             padding = 0,
--         },
--         highlights = {
--             tab_separator_selected = {
--                 bg = "#8AADF5",
--                 underline = true,
--             }
--         }
--     },
--     config = true
-- }
return {
    'nanozuki/tabby.nvim',
    event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local theme = {
            fill = 'TabLineFill',
            -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
            head = 'TabLine',
            current_tab = 'TabLineSel',
            tab = 'TabLine',
            win = 'TabLine',
            tail = 'TabLine',
        }
        require('tabby').setup({
            line = function(line)
                return {
                    {
                        { ' 󰲒 ', hl = theme.head },
                        line.sep('', theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep('', hl, theme.fill),
                            tab.is_current() and '' or '󰆣',
                            tab.number(),
                            tab.name(),
                            tab.close_btn(''),
                            line.sep('', hl, theme.fill),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        return {
                            line.sep('', theme.win, theme.fill),
                            win.is_current() and '' or '',
                            win.buf_name(),
                            line.sep('', theme.win, theme.fill),
                            hl = theme.win,
                            margin = ' ',
                        }
                    end),
                    {
                        line.sep('', theme.tail, theme.fill),
                        { '  ', hl = theme.tail },
                    },
                    hl = theme.fill,
                }
            end,
        })
    end
}
