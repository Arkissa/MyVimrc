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
        lspconfig.clangd.setup({
            init_options = {
                fallbackFlags = { "-x", "c" },
            },
            filetypes = { "c", "h" },
            cmd = {
                "clangd",
                "--enable-config",
                "--suggest-missing-includes",
                "--background-index", -- 后台建立索引，并持久化到disk
                "--clang-tidy",       -- 开启clang-tidy
                "--clang-tidy-checks=performance-*,bugprone-*",
                "--completion-style=detailed",
                "--cross-file-rename=true",
                "--header-insertion=iwyu",
                "--pch-storage=memory",
                "--function-arg-placeholders=false",
                "--ranking-model=decision_forest",
                "--header-insertion-decorators",
                "--pretty",
                "--all-scopes-completion",
            },
        })
        config.setup()
    end
}
