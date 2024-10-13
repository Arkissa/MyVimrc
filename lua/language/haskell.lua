local ht = require('haskell-tools')

require "lspsaga".setup {
    hover = {
        max_width = 0.5,
        open_link = "gx",
        open_browser = '!chrome',
    },
    ui = {
        border = "rounded",
        code_action = "",
    },
    implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
    },
}

local opts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
vim.keymap.set("n", "<LEADER>cl", vim.lsp.codelens.run, opts)
vim.keymap.set("n", "<LEADER>hs", ht.hoogle.hoogle_signature, opts)
vim.keymap.set("n", "<LEADER>ea", ht.lsp.buf_eval_all, opts)
vim.keymap.set("n", "<LEADER>rr", ht.repl.toggle, opts)
vim.keymap.set('n', '<LEADER>rq', ht.repl.quit, opts)
vim.keymap.set("n", "ss", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "sd", "<cmd>Lspsaga goto_definition<CR>", opts)
vim.keymap.set("n", "gk", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "sf", "<cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "sr", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "sa", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<LEADER>o", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
vim.keymap.set("n", "<LEADER>=", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "<LEADER>-", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
vim.keymap.set("n", "<LEADER>m", "<cmd>Lspsaga outline<CR>", opts)
vim.keymap.set("n", "sg", "<cmd>Lspsaga term_toggle<CR>", opts)
vim.keymap.set("n", "<A-r>", "<cmd>nohlsearch<CR>", opts)
