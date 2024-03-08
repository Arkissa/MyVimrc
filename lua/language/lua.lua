require "lsp" {
    lsp = "lua_ls",
    on_attach = function(_, bufnr)
        vim.keymap { k = "<A-r>"
        , v = "<CMD>source % | nohlsearch<CR>"
        , opt = { silent = true, nowait = true, buffer = bufnr }
        }
    end,
    auto_format = true,
    opt = require "lsp-zero".nvim_lua_ls()
}
