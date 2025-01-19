local opt = { silent = true, nowait = true }
vim.keymap.set("v", "<C-c>", [["+y]], opt)
vim.keymap.set("i", "<C-v>", "<C-R><C-O>+", opt)
vim.keymap.set("i", "<C-]>", "<C-X><C-]>", opt)
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opt)
vim.keymap.set("i", "<C-D>", "<C-X><C-D>", opt)
vim.keymap.set("i", "<C-L>", "<C-X><C-L>", opt)
