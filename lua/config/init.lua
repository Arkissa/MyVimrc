---@class KeyOpt
---@field noremap? boolean
---@field buffer? integer
---@field nowait? boolean
---@field silent? boolean
---@field expr? boolean
---@field callback? function
---@field desc? string

---@alias keymod
---| '"n"'
---| '"v"'
---| '"i"'
---| '"x"'

---@class KeyOpts
---@field mod? keymod|keymod[]
---@field k string
---@field v string|function
---@field opt? KeyOpt default {nowait = true, silent = true}

vim.keymap = setmetatable(vim.keymap, {
    ---@vararg KeyOpts
    __call = function(self, ...)
        if #{ ... } == 0 then
            return
        end

        for _, keyopt in ipairs({ ... }) do
            if not keyopt.mod then
                keyopt.mod = "n"
            end

            if not keyopt.opt then
                keyopt.opt = { silent = true, nowait = true }
            end

            self.set(keyopt.mod, keyopt.k, keyopt.v, keyopt.opt)
        end
    end
})

---@param gs table<string, any>
getmetatable(vim.g).__call = function(self, gs)
    for g, value in pairs(gs) do
        self[g] = value
    end
end

---@param opts table<string, any>
getmetatable(vim.opt).__call = function(self, opts)
    for opt, value in pairs(opts) do
        self[opt] = value
    end
end

require "config.keywords"
require "config.options"
require "config.autocmd"
