---@type table<string, string|string[]>
_G.ENV = {
    ---@type string
    vimrc = vim.fn.stdpath("config"),
    ---@type string
    filetype = vim.filetype.match { buf = vim.api.nvim_get_current_buf() },
    --@type string[]
    lsps = {
        "lua_ls",
        "gopls",
        "jsonls",
        "pylsp",
        "clangd",
        "bashls",
    },
    --@type string[]
    syntax = {
        "python",
        "go",
        "c",
        "lua",
        "cpp",
        "bash",
        "json",
        "regex",
        "toml",
        "vim",
        "yaml",
        "proto",
        "html",
        "sql",
        "agda",
        "haskell",
        "haskell_persistent",
        "fennel",
        "java",
        "markdown",
        "markdown_inline",
    }
}

require "config"
require "plugin"
