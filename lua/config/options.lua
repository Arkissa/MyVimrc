---@type fun(...: string[])
local sign = function(...)
    for _, opt in ipairs({ ... }) do
        vim.fn.sign_define(opt[1], {
            texthl = opt[1],
            text = opt[2],
            numhl = '',
        })
    end
end

---@type fun(...: string[])
local handlers = function(...)
    for _, method in ipairs({ ... }) do
        vim.lsp.handlers[method[1]] = vim.lsp.with(
            vim.lsp.handlers[method[2]],
            {
                border = "rounded",
            }
        )
    end
end

vim.opt {
    number = true,
    cindent = true,
    tabstop = 4,
    shiftwidth = 4,
    cursorline = true,
    tw = 0,
    autoindent = true,
    smartindent = true,
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
    sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize',
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
    loaded_netrwFileHandlers = 1,
    ---@type string[]
    lsps = {
        "lua_ls",
        "gopls",
        "jsonls",
        "pyright",
        "clangd",
        "bashls",
        "yamlls",
    },
    -- ---@type string
    vimrc = vim.fn.stdpath("config"),
    ---@type string[]
    syntax = {
        "python",
        "go",
        "gomod",
        "latex",
        "c",
        "lua",
        "d2",
        "luadoc",
        "luap",
        "cpp",
        "bash",
        "json",
        "regex",
        "toml",
        "javascript",
        "vim",
        "vimdoc",
        "make",
        "regex",
        "printf",
        "typescript",
        "scheme",
        "yaml",
        "toml",
        "proto",
        "html",
        "sql",
        "nix",
        "tlaplus",
        "agda",
        "haskell",
        "purescript",
        "haskell_persistent",
        "fennel",
        "java",
        "norg",
        "nix",
        "rust",
        "php",
        "phpdoc",
        "html",
        "css",
        "sql",
        "typst",
        "markdown",
        "markdown_inline",
    }
}

vim.opt.shortmess:append "c"
vim.cmd.filetype('plugin', 'indent', 'on')

vim.diagnostic.config {
    -- update_in_insert = true,
    severity_sort = true,
}
sign({ "DiagnosticSignError", "⏽" }
, { "DiagnosticSignWarn", "⏽" }
, { "DiagnosticSignHint", "⏽" }
, { "DiagnosticSignInfo", "⏽" }
)

handlers({ "textDocument/hover", "hover" }
, { "textDocument/signatureHelp", "signature_help" }
)
