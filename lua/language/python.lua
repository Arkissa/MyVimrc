require "lsp" {
    lsp = "pyright",
    opt = {
        settings = {
            pyright = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'openFilesOnly',
                },
            },
        },
    }
}
