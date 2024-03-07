return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    --keys = {
    --    { "<LEADER>f", ":Neotree action=show toggle<CR>", silent = true }
    --},
    config = function()
        vim.g {
            loaded_netrw = 1,
            loaded_netrwPlugin = 1,
            neo_tree_remove_legacy_commands = 1
        }

        vim.keymap {
            k = "<LEADER>f", v = "<CMD>Neotree action=show toggle<CR>"
        }
        require "neo-tree".setup {
            window = {
                width = 45
            }
        }
    end
}
