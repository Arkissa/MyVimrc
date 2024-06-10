-- return {
--
--     'junegunn/fzf',
--     dependencies = {
--         'junegunn/fzf.vim',
--     },
--     keys = {
--         { "<LEADER>b", "<CMD>Buffers<CR>",   silent = true },
--         { "<LEADER>;", "<CMD>Rg<CR>",        silent = true },
--         { "<LEADER>F", "<CMD>Files<CR>",     silent = true },
--         { "<LEADER>v", "<CMD>Filetypes<CR>", silent = true },
--     },
-- }
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    keys = {
        { "<LEADER>b", "<CMD>Telescope buffers<CR>",    silent = true },
        { "<LEADER>;", "<CMD>Telescope live_grep<CR>",  silent = true },
        { "<LEADER>F", "<CMD>Telescope find_files<CR>", silent = true },
        { "<LEADER>v", "<CMD>Telescope filetypes<CR>",  silent = true },
    },
    config = function()
        require 'telescope'.setup {
            -- defaults = {
            --     mappings = {
            --         n = {
            --             ["o"] = "select_default"
            --         }
            --     }
            -- },
        }
    end
}
