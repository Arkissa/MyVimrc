return {
    setup = function(config)
        -- config.on_attach(function(client, bufnr)
        --     config.buffer_autoformat()
        -- end)

        config.skip_server_setup({ 'hls' })
        config.setup()
        vim.g.haskell_tools = {
            capabilities = require 'lsp-zero'.build_options('hls', {}).capabilities,
            tools = {
                hover = {
                    stylize_markdown = true,
                    auto_focus = false,
                },
            },
            hls = {
                on_attach = function(client, bufnr)
                    local opts = { noremap = true, silent = true }
                    require "config.language.keywords".setup(client, bufnr,
                        {
                            { "n", "<leader>ca", "<cmd>lua vim.lsp.codelens.run()<cr>",                      opts },
                            { "n", "<leader>hs", "<cmd>lua require('haskell-tools').hoogle.hoogle_signature()<cr>",
                                opts },
                            { "n", "<leader>ea", "<cmd>lua require('haskell-tools').lsp.buf_eval_all()<cr>", opts },
                            { "n", "<leader>rf", "<cmd>lua require('haskell-tools').repl.toggle()<cr>",      opts },
                            { "n", "<leader>rq", "<cmd>lua require('haskell-tools').repl.quit()<cr>",        opts },
                        }
                    )
                end,
            },
        }
        require('haskell-tools').lsp.start()
    end
}
