local opt = { silent = true, nowait = true }

vim.keymap.set("n", "zk", "ZZ", opt)
vim.keymap.set("v", "<LEADER>c", [["+y]], opt)
vim.keymap.set("i", "<C-V>", [[<C-r>+]], opt)
vim.keymap.set("v", ">", ">gv", opt)
vim.keymap.set("v", "<", "<gv", opt)
-- vim.keymap.set("v", "p", '"_dP', opt)
-- vim.keymap.set("n", "sD", ":bdelete<CR>", opt)
vim.keymap.set("i", "<C-]>", "<C-X><C-]>", opt)
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opt)
vim.keymap.set("i", "<C-D>", "<C-X><C-D>", opt)
vim.keymap.set("i", "<C-L>", "<C-X><C-L>", opt)
