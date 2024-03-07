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
--vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
vim.opt.rtp:prepend(lazypath)

vim.keymap { k = "<leader>pl", v = ":Lazy<CR>" }

local mods = {}
local extend = ".lua"
local path = _G.ENV["vimrc"] .. "/lua/plugins"

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

for file, type in vim.fs.dir(path) do
    if type[1] == 'd' or not is_lua(file) then
        goto continue
    end
    table.insert(mods, require("plugins." .. vim.fn.split(file, extend)[1]))
    ::continue::
end


require "lazy".setup(mods, {
    defaults = {
        lazy = true
    }
})
