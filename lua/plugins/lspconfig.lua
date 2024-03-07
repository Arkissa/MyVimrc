return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {
            'stevearc/conform.nvim',
        },
        {
            "ray-x/lsp_signature.nvim",
            opts = {
                hint_prefix = "",
            },
        },
        {
            "neovim/nvim-lspconfig",
            "RRethy/vim-illuminate",
            "glepnir/lspsaga.nvim",
            'williamboman/mason-lspconfig.nvim',
            "folke/neodev.nvim",
            {
                'williamboman/mason.nvim',
                build = function()
                    vim.cmd [[MasonInstall]]
                end,
            },
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
    --ft = { "go", "gomod", "haskell", "rust", "java", "sh", "json", "python", "c", "cpp", "h" },
}
