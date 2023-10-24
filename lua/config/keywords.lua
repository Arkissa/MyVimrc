K = {}

local keymap = vim.keymap.set
local opt = { silent = true, nowait = true }
local map = { "n", "v", "x" }
local setkeymap = {
    { map, ";",         ":",                                nil },
    { "n", "s",         "<nop>",                            opt },
    { "n", "S",         ":w<CR>",                           opt },
    { "n", "Q",         ":q<CR>",                           opt },
    { "n", "<A-s>k",    ":e $MYVIMRC<CR>",                  opt },
    { "n", "sr",        ":source $MYVIMRC<CR>",             opt },
    { "n", "sh",        ":set nosplitright<CR>:vsplit<CR>", opt },
    { "n", "sk",        ":set splitright<CR>:split<CR>",    opt },
    { "n", "sj",        ":set nosplitright<CR>:split<CR>",  opt },
    { "n", "st",        ":tabe<CR>",                        opt },
    { "n", "si",        ":+tabnext<CR>",                    opt },
    { "n", "su",        ":-tabnext<CR>",                    opt },
    { "n", "s,",        "<CMD>lua G.wordWrap('<')<CR>",     opt },
    { "n", "s'",        "<CMD>lua G.wordWrap('\\'')<CR>",   opt },
    { "n", "s\"",       "<CMD>lua G.wordWrap('\"')<CR>",    opt },
    { "n", "s(",        "<CMD>lua G.wordWrap('(')<CR>",     opt },
    { "n", "s[",        "<CMD>lua G.wordWrap('[')<CR>",     opt },
    { "n", "s{",        "<CMD>lua G.wordWrap('{')<CR>",     opt },
    { "n", "<SPACE>q",  ":qa<CR>",                          opt },
    { "n", "<SPACE>j",  "<C-w>j",                           opt },
    { "n", "<SPACE>k",  "<C-w>k",                           opt },
    { "n", "<SPACE>h",  "<C-w>h",                           opt },
    { "n", "<SPACE>l",  "<C-w>l",                           opt },
    { "n", "<SPACE>sp", ":set spell!<CR>",                  opt },
    { "n", "<Up>",      ":res +5<CR>",                      opt },
    { "n", "<Down>",    ":res -5<CR>",                      opt },
    { "n", "<Left>",    ":vertical resize+5<CR>",           opt },
    { "n", "<Right>",   ":vertical resize-5<CR>",           opt },
    { "v", "<C-c>",     [["+y]],                            opt },
    { "n", "<C-p>",     [["+p]],                            opt },
    { "i", "<C-p>",     "<C-r>+",                           opt },
    { "v", ">",         ">gv",                              opt },
    { "v", "<",         "<gv",                              opt },
    { "v", "p",         '"_dP',                             opt },
    { "n", "sD",        ":bd!<CR>",                         opt },
    --{ "n", "sy",         ":OpenClip<CR>",                    opt },
    --{ "n", "sP",         ":PastUpload<CR>",                  opt },
    --{ "n", "sp",         ":PastImage<CR>",                   opt },
    --{ "i", ",y",         "<ESC>:OpenClip<CR>",               opt },
    --{ "i", ",p",         "<ESC>:PastImage<CR>i",             opt },
    --{ "i", ",P",         "<ESC>:PastUpload<CR>i",            opt },
    { "i", "(",         "()<ESC>i",                         opt },
    { "i", "[",         "[]<ESC>i",                         opt },
    { "i", "{",         "{}<ESC>i",                         opt },
    { "i", "\"",        [[""<ESC>i]],                       opt },
    { "i", "'",         [[''<ESC>i]],                       opt },
}

for i = 1, #setkeymap do keymap(unpack(setkeymap[i])) end
K.addKeymap = function(add)
    if not add then return end

    for i = 1, #add do keymap(unpack(add[i])) end
end

return K
