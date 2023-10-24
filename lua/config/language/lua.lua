return {
    setup = function(config)
        config.on_attach(function(client, bufnr)
            require "config.language.keywords".setup(client, bufnr,
                {
                    { "n", "<A-r>", ":source % | nohlsearch <CR>", { noremap = true, silent = true, nowait = true } },
                })
            config.buffer_autoformat()
            require("neodev").setup()
        end)
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
        lspconfig[G.lang.lsp].setup(config.nvim_lua_ls())
        config.setup()
    end
}
