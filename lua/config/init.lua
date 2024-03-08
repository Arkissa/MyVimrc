vim.loader.enable()

---@class Event
---@field id number
---@field event string
---@field group? number
---@field match string
---@field buf number
---@field file string
---@field data any

---@class AuOpt
---@field group? string|integer
---@field pattern? string|table<string>
---@field buffer? integer
---@field desc? string
---@field callback? string|fun(ev: Event)
---@field command? string
---@field once? boolean
---@field nested? boolean

---@type fun(event: string|string[], opt: AuOpt): integer
vim.api.nvim_create_autocmd = vim.api.nvim_create_autocmd

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

---@class Keymap
---@field set function
---@field del function


---@type fun(self, ...: KeyOpt) | Keymap
---@diagnostic disable-next-line: param-type-mismatch
vim.keymap = setmetatable(vim.keymap, {
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

---@type fun(self, gs: table<string, any>)
getmetatable(vim.g).__call = function(self, gs)
    for g, value in pairs(gs) do
        self[g] = value
    end
end

---@type fun(self, opts: table<string, any>)
getmetatable(vim.opt).__call = function(self, opts)
    for opt, value in pairs(opts) do
        self[opt] = value
    end
end

require "config.autocmd"
require "config.keywords"
require "config.options"
