require "lsp" {
    lsp = "gopls",
    auto_format = true,
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
