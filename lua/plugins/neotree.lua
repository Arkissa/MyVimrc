return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<LEADER>f", ":Neotree action=show toggle<CR>", silent = true }
    },
    config = function()
        vim.g {
            loaded_netrw = 1,
            loaded_netrwPlugin = 1,
            neo_tree_remove_legacy_commands = 1
        }

        require "neo-tree".setup {
            window = {
                width = 45
            }
        }
    end
}
