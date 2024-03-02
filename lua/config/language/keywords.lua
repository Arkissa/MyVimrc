local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap

return {
    setup = function(client, bufnr, table)
        local map = {
            { "n", "gs",        "<cmd>Lspsaga peek_definition<CR>",                opts },
            { "n", "gd",        "<cmd>Lspsaga goto_definition<CR>",                opts },
            { "n", "gk",        "<cmd>lua vim.lsp.buf.hover()<CR>",                opts },
            { "n", "gi",        "<cmd>Lspsaga finder<CR>",                         opts },
            { "n", "gj",        "<cmd>Lspsaga rename<CR>",                         opts },
            { "n", "sf",        "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts },
            { "n", "sa",        "<cmd>Lspsaga code_action<CR>",                    opts },
            { "n", "<leader>o", "<cmd>Lspsaga show_workspace_diagnostics<CR>",     opts },
            { "n", "<leader>=", "<cmd>Lspsaga diagnostic_jump_next<cr>",           opts },
            { "n", "<leader>-", "<cmd>Lspsaga diagnostic_jump_prev<cr>",           opts },
            { "n", "<leader>m", "<cmd>Lspsaga outline<CR>",                        opts },
            { "i", "<C-l>",     "<cmd>lua vim.lsp.buf.signature_help()<CR>",       opts },
            -- { "n", "<C-/>",     ":Comm<CR>",                                      opts },
            -- { "v", "<C-/>",     ":Comm<CR>",                                      opts },
            { "n", "sG",        "<cmd>Lspsaga term_toggle<CR>",                    opts },
            { "n", "<A-r>",     "<cmd>nohlsearch <CR>",                            opts },
        }

        for _, value in pairs(map) do keymap(bufnr, unpack(value)) end
        local status_ok, illuminate = pcall(require, "illuminate")
        if not status_ok then return end

        illuminate.on_attach(client)
        if not table then
            return
        end

        for _, value in pairs(table) do
            keymap(bufnr, unpack(value))
        end
    end
}
