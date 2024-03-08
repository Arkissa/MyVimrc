local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap { k = "<leader>pl", v = ":Lazy<CR>" }

local extend = ".lua"
local path = vim.g.vimrc .. "/lua/plugins"

---@param file string
---@return boolean
local function is_lua(file)
    local idx = #file - #extend
    for i = 1, 4 do
        if file:byte(idx + i) ~= extend:byte(i) then
            return false
        end
    end

    return true
end

local mods = {}
local ffi = require "ffi"
local buffer = ffi.new("char[100]", "plugins.")
for file, t in vim.fs.dir(path) do
    if t:byte(1) == 102 and is_lua(file) then
        local len = file:len() - 4
        for i = 1, len do
            buffer[7 + i] = file:byte(i)
        end

        table.insert(mods, require(ffi.string(buffer, 8 + len)))
    end
end

require "lazy".setup(mods, {
    defaults = {
        lazy = true
    }
})
