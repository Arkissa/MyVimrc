vim.keymap({ mod = { "n", "v", "x" }, k = ";", v = ":", opt = {} }
, { k = "s", v = "<nop>", }
, { k = "S", v = ":w<CR>", }
, { k = "Q", v = ":q<CR>", }
, { k = "<A-s>k", v = ":e $MYVIMRC<CR>", }
, { k = "sr", v = ":source $MYVIMRC<CR>", }
, { k = "sh", v = ":set nosplitright<CR>:vsplit<CR>", }
, { k = "sk", v = ":set splitright<CR>:split<CR>", }
, { k = "sj", v = ":set nosplitright<CR>:split<CR>", }
, { k = "st", v = ":tabe<CR>", }
, { k = "si", v = ":+tabnext<CR>", }
, { k = "su", v = ":-tabnext<CR>", }
, { k = "<SPACE>q", v = ":qa<CR>", }
, { k = "<SPACE>j", v = "<C-w>j", }
, { k = "<SPACE>k", v = "<C-w>k", }
, { k = "<SPACE>h", v = "<C-w>h", }
, { k = "<SPACE>l", v = "<C-w>l", }
, { k = "<SPACE>sp", v = ":set spell!<CR>", }
, { k = "<Up>", v = ":res +5<CR>", }
, { k = "<Down>", v = ":res -5<CR>", }
, { k = "<Left>", v = ":vertical resize+5<CR>", }
, { k = "<Right>", v = ":vertical resize-5<CR>", }
, { mod = "v", k = "<C-c>", v = [["+y]] }
, { k = "<C-p>", v = [["+p]], }
, { k = "<C-p>", v = "<C-r>+", }
, { k = ">", v = ">gv", }
, { k = "<", v = "<gv", }
, { mod = "v", k = "p", v = '"_dP' }
, { k = "sD", v = ":bd!<CR>", }
)
