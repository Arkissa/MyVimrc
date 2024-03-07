vim.opt {
    number = true,
    tabstop = 4,
    shiftwidth = 4,
    tw = 0,
    textwidth = 100,
    encoding = "utf-8",
    softtabstop = 4,
    backspace = { "indent", "eol", "start" },
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
    termguicolors = true,
}

vim.g {
    mapleader = " ",
    python3_host_prog = (vim.env["VIRTUAL_ENV"] ~= vim.NIL and vim.env["VIRTUAL_ENV"] or "") .. "python",
    loaded_gzip = 1,
    loaded_zip = 1,
    loaded_zipPlugin = 1,
    loaded_tar = 1,
    loaded_tarPlugin = 1,
    loaded_getscript = 1,
    loaded_getscriptPlugin = 1,
    loaded_vimball = 1,
    loaded_vimballPlugin = 1,
    loaded_2html_plugin = 1,
    loaded_matchit = 1,
    loaded_matchparen = 1,
    loaded_logiPat = 1,
    loaded_rrhelper = 1,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    loaded_netrwSettings = 1,
    loaded_netrwFileHandlers = 1
}


vim.cmd [[
augroup filetypedetect
    au! BufRead,BufNewFile *.h         setfiletype c
augroup END
]]
vim.cmd [[set cindent]]
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

vim.loader.enable()
vim.opt.shortmess:append "c"
vim.cmd.filetype('plugin', 'indent', 'on')
local sign = function(opts)
    vim.fn.sign_define(opts[1], {
        texthl = opts[1],
        text = opts[2],
        numhl = '',
    })
end

sign { "DiagnosticSignError", "⏽" }
sign { "DiagnosticSignWarn", "⏽" }
sign { "DiagnosticSignHint", "⏽" }
sign { "DiagnosticSignInfo", "⏽" }

vim.diagnostic.config {
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        prefix = "WARNING: ",
    },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = "rounded",
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = "rounded",
    }
)
