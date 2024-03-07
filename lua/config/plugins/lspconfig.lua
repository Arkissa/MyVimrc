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
        ft = { "go", "gomod", "haskell", "rust", "lua", "java", "sh", "json", "python", "c", "cpp", "h" },
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        ft = { "go", "gomod", "haskell", "rust", "lua", "java", "sh", "json", "python", "c", "cpp", "h" },
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
                    },
                    {
                        'williamboman/mason-lspconfig.nvim',
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
            {
                'stevearc/conform.nvim',
                ft = 'python'
            },
        },
        config = function()
            local lspconfig = require "lsp-zero".preset {}
            lspconfig.set_server_config({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })
            require "mason".setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            }

            require "mason-lspconfig".setup {
                automatic_installation = true,
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "jsonls",
                    "clangd",
                    "bashls",
                },
                handlers = {
                    lspconfig.default_setup,
                    [G.lsp] = function()
                        config()
                        local ok, lsp = pcall(require, "config.language." .. G.file_type)
                        if not ok then return end
                        lsp.setup(lspconfig)
                        C.setup()
                    end
                }
            }
        end
    },
}
