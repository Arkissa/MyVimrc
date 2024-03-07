require "lsp" {
    lsp = "pylsp",
    opt = {
        settings = {
            pylsp = {
                plugins = {
                    ruff = {
                        enable = true,
                        formatEnable = true
                    }
                }
            }
        }
    },
    auto_format = true,
}
