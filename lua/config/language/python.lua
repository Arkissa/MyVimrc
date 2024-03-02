return {
    setup = function(config)
        config.on_attach(function(client, bufnr)
            config.buffer_autoformat()
            require("config.language.keywords").setup(client, bufnr, {})
        end)
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- require "conform".setup {
        --     formatters_by_ft = {
        --         python = { "ruff" }
        --     },
        --     format_on_save = {
        --         timeout_ms = 500,
        --         lsp_fallback = true,
        --     },
        -- }

        lspconfig.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        isort = { enabled = true },
                        pyre  = {
                            enabled = true,
                            create_pyre_config = true
                        },
                        ruff  = {
                            select = {},
                            enabled = true,
                            formatEnabled = true,
                            lineLength = 88,
                            fixable = nil,
                        },
                    }
                },
            }
        }
        config.setup()
    end
}
