return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    ft = { "go", "gomod", "json", "python", "c", "cpp", "h", "lua", "haskell" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "RRethy/vim-illuminate",
        "glepnir/lspsaga.nvim",
        'williamboman/mason-lspconfig.nvim',
        "folke/neodev.nvim",
        'stevearc/conform.nvim',
        {
            "ray-x/lsp_signature.nvim",
            opts = {
                hint_prefix = "",
            },
        },
        {
            'williamboman/mason.nvim',
            build = function()
                vim.cmd [[MasonInstall]]
            end,
        },
        {
            'j-hui/fidget.nvim',
            tag = "legacy",
            event = "LspAttach",
            opts = {
                text = {
                    spinner = "square_corners",
                    commenced = "",
                    completed = ""
                },
                window = { relative = "win" },
                timer = {
                    fidget_decay = 3000,
                    task_decay = 1500
                },
            },
        },
    },
}
