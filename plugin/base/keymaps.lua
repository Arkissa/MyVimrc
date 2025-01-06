local opt = { silent = true, nowait = true }

vim.keymap.set("v", ">", ">gv", opt)
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("i", "<C-v>", "<C-R>+", opt)
-- vim.keymap.set("v", "p", '"_dP', opt)
-- vim.keymap.set("n", "sD", ":bdelete<CR>", opt)
vim.keymap.set("i", "<C-]>", "<C-X><C-]>", opt)
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opt)
vim.keymap.set("i", "<C-D>", "<C-X><C-D>", opt)
vim.keymap.set("i", "<C-L>", "<C-X><C-L>", opt)
