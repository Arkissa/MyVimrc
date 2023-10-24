return {
    setup = function(config)
        config.on_attach(function(client, bufnr)
            config.buffer_autoformat()
            require("config.language.keywords").setup(client, bufnr)
        end)
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
        lsp_defaults.capabilities.textDocument.completion.completionItem.snippetSupport = true

        lspconfig[G.lang.lsp].setup {}
        config.setup()
    end
}
