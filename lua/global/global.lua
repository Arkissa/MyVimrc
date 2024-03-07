local ft, _ = vim
    .filetype
    .match({ filename = vim.fn.expand("%:p") })
ft = not ft and vim.fn.expand("%:e") or ft

G = {
    ---@type string
    vimrc = vim.fn.stdpath("config"),
    ---@type string
    mode_suffix = ".lua",
    ---@type string
    file_type = ft,
    ---@type string
    lsp = ({
        lua = "lua_ls",
        c = "clangd",
        go = "gopls",
        python = "pylsp",
        haskell = "hls",
        json = "jsonls",
    })[ft],
    ---@type table
    icon = {
        ---@type string
        Text = "",
        ---@type string
        Method = "󰆧",
        ---@type string
        Function = "󰊕",
        ---@type string
        Constructor = "",
        ---@type string
        Field = "󰇽", ---@type string
        Variable = "󰂡",
        ---@type string
        Class = "󰠱",
        Interface = "",
        ---@type string
        Module = "",
        ---@type string
        Property = "󰜢",
        ---@type string
        Unit = "",
        ---@type string
        Value = "󰎠",
        ---@type string
        Enum = "",
        ---@type string
        Keyword = "󰌋",
        ---@type string
        Snippet = "",
        ---@type string
        Color = "󰏘",
        ---@type string
        File = "󰈙",
        ---@type string
        Reference = "",
        ---@type string
        Folder = "󰉋",
        ---@type string
        EnumMember = "",
        ---@type string
        Constant = "󰏿",
        ---@type string
        Struct = "",
        ---@type string
        Event = "",
        ---@type string
        Operator = "󰆕",
        ---@type string
        TypeParameter = "󰅲",
    },
}

if ft == "python" then
    local venv = vim.fn.getenv("VIRTUAL_ENV")
    G.pyvenv = (venv and venv or "")
end

vim.schedule(function()
    ---@type string
    G.home = vim.fn.getenv("HOME")
    ---@type string
    G.pwd = vim.fn.getcwd()
    ---@type string
    G.stdPath = vim.fn.stdpath("data")
    local folder = vim.fn.getcwd()
    if type(folder) == "string" then
        local path = string.byte("/", 1)
        for i = #folder, 1, -1 do
            if folder:byte(i) == path then
                G.folder = folder:sub(i + 1)
                return
            end
        end
    else
        G.folder = ""
    end
end)

---@param path string
---@param config string
function G:load(path, config)
    local dir = io.popen("ls " .. path)
    if not dir then
        error("not found " .. path)
    end

    local mods = {}
    local extend = ".lua"
    for line in dir:lines() do
        if not G.isdirectory(path .. "/" .. line) or line:find(extend, #line - #extend) == nil then
            goto continue
        end

        table.insert(mods, require(config .. "." .. G.split(line, extend)[1]))
        ::continue::
    end

    dir:close()
    return mods
end

G = setmetatable(G, { __index = vim.fn })

return G
