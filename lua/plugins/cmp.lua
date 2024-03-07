return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'dcampos/nvim-snippy',
        'dcampos/cmp-snippy',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'Arkissa/cmp-agda-symbols',
    },
    event = "InsertEnter",
    config = function()
        local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or
                vim
                .fn
                .getline(".")
                :sub(col, col)
                :match "%s"
        end


        local status_ok, cmp = pcall(require, "cmp")
        if not status_ok then return end

        local snippy_ok, snippy = pcall(require, 'snippy')
        if not snippy_ok then return end
        snippy.setup {
            snippet_dirs = _G.ENV.vimrc .. "/snippets",
            local_snippet_dir = '.snippets',
            mappings = {
                is = {
                    ['<Tab>'] = 'expand_or_advance',
                    ['<S-Tab>'] = 'previous',
                },
                nx = {
                    ['<leader>x'] = 'cut_text',
                },
            },
        }

        local icon = {
            ---@type string
            Text = "",
            ---@type string
            Method = "󰆧",
            ---@type string
            Function = "󰊕",
            ---@type string
            Constructor = "",
            ---@type string
            Field = "󰇽", ---@type string
            Variable = "󰂡",
            ---@type string
            Class = "󰠱",
            Interface = "",
            ---@type string
            Module = "",
            ---@type string
            Property = "󰜢",
            ---@type string
            Unit = "",
            ---@type string
            Value = "󰎠",
            ---@type string
            Enum = "",
            ---@type string
            Keyword = "󰌋",
            ---@type string
            Snippet = "",
            ---@type string
            Color = "󰏘",
            ---@type string
            File = "󰈙",
            ---@type string
            Reference = "",
            ---@type string
            Folder = "󰉋",
            ---@type string
            EnumMember = "",
            ---@type string
            Constant = "󰏿",
            ---@type string
            Struct = "",
            ---@type string
            Event = "",
            ---@type string
            Operator = "󰆕",
            ---@type string
            TypeParameter = "󰅲",
        }

        cmp.setup {
            snippet = {
                expand = function(args)
                    require 'snippy'.expand_snippet(args.body)
                end
            },
            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, { "i", "s", }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<A-e>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
            },
            sources = cmp.config.sources({
                { name = 'snippy',  option = { show_autosnippets = true } },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'buffer' },
                { name = 'path' },
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                maxwidth = 60,
                maxheight = 10,
                format = function(entry, vim_item)
                    vim_item.kind = icon[vim_item.kind]
                    vim_item.menu = ({
                        snippy = "[Snip]",
                        nvim_lsp = "[LSP]",
                        buffer = "[Buf]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                },
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                },
            },
            experimental = {
                ghost_text = true,
            },
        }
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = 'path' } }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })
        cmp.setup.filetype({ "agda", "haskell" }, {
            sources = {
                { name = 'agda-symbols' },
            }
        })
    end
}
