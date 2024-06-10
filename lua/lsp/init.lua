---@class Lsp
---@field lsp string
---@field on_attach? fun(client: any, bufnr: integer)
---@field opt table
---@field auto_format? boolean
---@field async_autoformat? boolean

local lsp = require "lsp-zero".preset {}
lsp.set_server_config {
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
}

require "mason".setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require "mason-lspconfig".setup {
    automatic_installation = true,
    ensure_installed = vim.g.lsps,
    handlers = {
        lsp.default_setup,
    }
}

require "lspsaga".setup {
    hover = {
        max_width = 0.5,
        open_link = "gx",
        open_browser = '!chrome',
    },
    ui = {
        border = "rounded",
        code_action = "",
    },
    implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
    }
}

---@param config Lsp
return function(config)
    local nvim_lsp_ = require "lspconfig"
    nvim_lsp_.util.default_config.capabilities = lsp.get_capabilities()
    lsp.on_attach(function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap({ k = "ss", v = "<cmd>Lspsaga peek_definition<CR>", opt = opts }
        , { k = "sd", v = "<cmd>Lspsaga goto_definition<CR>", opt = opts }
        , { k = "gk", v = "<cmd>Lspsaga hover_doc<CR>", opt = opts }
        , { k = "sf", v = "<cmd>Lspsaga finder<CR>", opt = opts }
        , { k = "sr", v = "<cmd>Lspsaga rename<CR>", opt = opts }
        , { k = "sa", v = "<cmd>Lspsaga code_action<CR>", opt = opts }
        , { k = "<leader>o", v = "<cmd>Lspsaga show_workspace_diagnostics<CR>", opt = opts }
        , { k = "<leader>=", v = "<cmd>Lspsaga diagnostic_jump_next<cr>", opt = opts }
        , { k = "<leader>-", v = "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt = opts }
        , { k = "<leader>m", v = "<cmd>Lspsaga outline<CR>", opt = opts }
        -- , { k = "sg", v = "<cmd>Lspsaga term_toggle<CR>", opt = opts }
        , { k = "<A-r>", v = "<cmd>nohlsearch<CR>", opt = opts }
        )
        require 'lsp_signature'.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, bufnr)

        require "illuminate".on_attach(client)
        if config.auto_format then
            lsp.buffer_autoformat(client, bufnr)
        elseif config.async_autoformat then
            lsp.async_autoformat(client, bufnr)
        end

        if config.on_attach then
            config.on_attach(client, bufnr)
        end
    end)

    nvim_lsp_[config.lsp].setup(config.opt)
    lsp.setup()
end
