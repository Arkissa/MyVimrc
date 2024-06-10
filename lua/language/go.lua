require "lsp" {
    lsp = "gopls",
    async_autoformat = true,
    on_attach = function(_, bufnr)
        vim.keymap.set("n", "sp", "<cmd>Lspsaga finder imp<CR>", { noremap = true, silent = true, buffer = bufnr })
    end,
    opt = {
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        }
    }
}
