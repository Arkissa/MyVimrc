return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    ft = "alpha",
    -- or                              , branch = '0.1.x',
    keys = {
        { "<LEADER>b", "<CMD>Telescope buffers<CR>",     silent = true },
        { "<LEADER>;", "<CMD>Telescope live_grep<CR>",   silent = true },
        { "<LEADER>'", "<CMD>Telescope grep_string<CR>", silent = true },
        { "<LEADER>F", "<CMD>Telescope find_files<CR>",  silent = true },
        { "<LEADER>v", "<CMD>Telescope filetypes<CR>",   silent = true },
    },
    dependencies = {
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require("telescope")

        -- first setup telescope
        telescope.setup({
            -- your config
        })

        -- then load the extension
        telescope.load_extension("live_grep_args")
    end
}
