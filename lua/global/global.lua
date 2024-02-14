local ft, _ = vim
    .filetype
    .match({ filename = vim.fn.expand("%:p") })
ft = not ft and vim.fn.expand("%:e") or ft

G = {
    home = os.getenv("HOME"),
    pwd = vim.fn.getcwd(),
    folder = vim.split(vim.fn.system("basename `pwd`"), "\n")[1],
    stdPath = vim.fn.stdpath("data"),
    vimrc = vim.fn.stdpath("config"),
    imgUrl = "https://fishpi.cn/upload",
    imgPath = "./img",
    modeSuffix = ".lua",
    fileType = ft,
    lang = ({
        lua = {
            lsp = "lua_ls",
            comm = "--"
        },
        go = {
            lsp = "gopls",
            comm = "//"
        },
        python = {
            lsp = "pyright",
            comm = "#"
        },
        c = {
            lsp = "clangd",
            comm = "//"
        },
        h = {
            lsp = "clangd",
            comm = "//"
        },
        json = {
            lsp = "jsonls",
            comm = "//"
        },
        haskell = {
            lsp = "hls",
            comm = "--"
        }
    })[ft],
}

G.icon = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}

function G:load(path, config)
    local mod = {}
    local files = G.filter(G.split(G.system("ls " .. path), "\n"), function(_, x)
        return G.isdirectory(path .. "/" .. x) == 0
    end)

    local modules = G.filter(files, function(_, x)
        return string.find(x, G.modeSuffix, #x - #G.modeSuffix)
    end)

    for _, v in ipairs(G.map(modules, function(_, x)
        return config .. "." .. G.split(x, G.modeSuffix)[1]
    end))
    do
        if v then
            table.insert(mod, require(v))
        end
    end

    return mod
end

local wrapStr = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["<"] = ">"
}

local function getWrapStr(char)
    if wrapStr[char] == nil then
        return char, char
    end

    return char, wrapStr[char]
end

local function wrap(str, char)
    local before, after = getWrapStr(char)
    return before .. str .. after
end

local function getWord()
    return G.expand("<cword>")
end

function G.getViusalLine()
    local posStart, posEnd = G.getpos("'<"), G.getpos("'>")
    local line = { posStart, posEnd }
    table.sort(line, function(s, e)
        return s[2] < e[2]
    end)


    return { line[0][2], line[0][3] }, { line[1][2], line[0][3] }
end

function G.blockWrap(char)

end

function G.wordWrap(char)
    local word = getWord()
    local line = G.getline('.')
    local s, e = line:find(word)

    G.setline(G.line('.'), line:sub(1, s - 1) .. wrap(word, char) .. line:sub(e + 1))
end

G = setmetatable(G, { __index = vim.fn })

return G
