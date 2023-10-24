local config = function()
    local signs = {
        { name = "DiagnosticSignError", text = "⏽" },
        { name = "DiagnosticSignWarn", text = "⏽" },
        { name = "DiagnosticSignHint", text = "⏽" },
        { name = "DiagnosticSignInfo", text = "⏽" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    local config = {
        signs = {
            active = signs, -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            prefix = "WARNING: ",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = "rounded",
        }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
            border = "rounded",
        }
    )
end

return {
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        ft = { "go", "gomod", "haskell", "rust", "lua", "java", "sh", "json", "python", "c", "cpp" },
        dependencies = {
            {
                "ray-x/lsp_signature.nvim",
                event = "VeryLazy",
                opts = {
                    hint_prefix = "",
                },
                config = function(_, opts) require 'lsp_signature'.setup(opts) end
            },
            {
                'neovim/nvim-lspconfig',
                dependencies = {
                    'RRethy/vim-illuminate',
                    {
                        "glepnir/lspsaga.nvim",
                        config = function()
                            require("lspsaga").setup({
                                hover = {
                                    max_width = 0.5,
                                    open_link = "gx",
                                    open_browser = '!chrome',
                                },
                                ui = {
                                    border = "rounded",
                                    code_action = "",
                                }
                            })
                        end
                    },
                    {
                        'williamboman/mason.nvim',
                        build = function()
                            vim.cmd([[MasonInstall]])
                        end,
                        config = function()
                            require("mason").setup({
                                ui = {
                                    icons = {
                                        package_installed = "✓",
                                        package_pending = "➜",
                                        package_uninstalled = "✗"
                                    }
                                }
                            })
                        end
                    },
                    {
                        'williamboman/mason-lspconfig.nvim',
                        config = function()
                            require("mason-lspconfig").setup({
                                automatic_installation = true,
                            })
                        end
                    },
                    {
                        "folke/neodev.nvim",
                        ft = "lua",
                    },
                }
            },
            {
                'j-hui/fidget.nvim',
                tag = "legacy",
                event = "LspAttach",
                opts = {
                    text = {
                        spinner = "square_corners",
                        commenced = "",
                        completed = ""
                    },
                    window = { relative = "win" },
                    timer = {
                        fidget_decay = 3000,
                        task_decay = 1500
                    },
                    fmt = {
                    }
                },
            },
        },
        config = function()
            --local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require "lsp-zero".preset {}
            lspconfig.set_server_config({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })
            lspconfig.ensure_installed({
                "lua_ls",
                "gopls",
                "jsonls",
                "pyright",
                "clangd",
                "bashls",
            })

            config()
            local ok, lsp = pcall(require, "config.language." .. G.fileType)
            if not ok then return end
            lsp.setup(lspconfig)
            require "config.plugins.cmp".setup()
        end
    },
}
