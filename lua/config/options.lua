O = {}

local opt = {
    number = true,
    tabstop = 4,
    shiftwidth = 4,
    tw = 0,
    textwidth = 100,
    encoding = "utf-8",
    softtabstop = 4,
    backspace = { "indent", "eol", "start" },
    tags = { "./.tags", ".tags", "./**/.tags" },
    showcmd = true,
    wildmenu = true,
    wrap = true,
    scrolloff = 40,
    sidescroll = 20,
    laststatus = 2,
    showmatch = true,
    expandtab = true,
    hlsearch = true,
    incsearch = true,
    smartcase = true,
    ignorecase = true,
    ttimeout = true,
    ttimeoutlen = 100,
    updatetime = 100,
    syntax = "on",
    termguicolors = true,
}

for key, value in pairs(opt) do vim.opt[key] = value end

O.addOpt = function(option)
    if not option then return end

    for i = 1, #option do vim[option[i][1]][option[i][2]] = option[i][3] end
end

vim.g.python3_host_prog = "python"
vim.loader.enable()
vim.opt.shortmess:append "c"
vim.g.mapleader = " "
vim.cmd.filetype = { "on", indent = "on", plugin = "on" }
vim.cmd [[
augroup filetypedetect
    au! BufRead,BufNewFile *.h         setfiletype c
augroup END
]]
vim.cmd [[set cindent]]
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

return O
