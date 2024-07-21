-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "yaml",
--     callback = function(_)
--         vim.bo.formatexpr = "yamlfmt /dev/stdin"
--     end
-- })

require "lsp" {
    lsp = "yamlls",
    auto_format = true,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
}
