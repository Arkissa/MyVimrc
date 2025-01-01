local opt = { silent = true }

vim.keymap.set("n", "zk", "ZZ", opt)
vim.keymap.set("n", "sr", ":source $MYVIMRC<CR>", opt)
vim.keymap.set("v", "<C-c>", [["+y]], opt)
vim.keymap.set({ "n", "i" }, "<C-s>v", [["+p]], opt)
vim.keymap.set("v", ">", ">gv", opt)
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("v", "p", '"_dP', opt)
vim.keymap.set("n", "sD", ":hide<CR>", opt)
vim.keymap.set("i", "<C-]>", "<C-X><C-]>", opt)
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opt)
vim.keymap.set("i", "<C-D>", "<C-X><C-D>", opt)
vim.keymap.set("i", "<C-L>", "<C-X><C-L>", opt)