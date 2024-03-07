---@class Lsp
---@field lsp string
---@field on_attach? fun(client: any, bufnr: integer)
---@field opt table
---@field auto_format? boolean

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
    ensure_installed = _G.ENV.lsps,
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
    }
}

require 'lsp_signature'.setup {}

---@param config Lsp
return vim.schedule_wrap(function(config)
    local nvim_lsp_ = require "lspconfig"
    local nvim_lsp = nvim_lsp_.util.default_config

    nvim_lsp.capabilities = vim.tbl_deep_extend(
        "force",
        nvim_lsp.capabilities,
        require "cmp_nvim_lsp".default_capabilities()
    )

    nvim_lsp_[config.lsp].setup(vim.tbl_deep_extend("force", config.opt, {
        auto_start = false,
    }))
    lsp.on_attach(function(client, bufnr)
        local ok, illuminate = pcall(require, "illuminate")
        if ok and (client.supports_method("textDocument/documentHighlight")
                or client.supports_method("textDocument/codeAction")) then
            illuminate.on_attach(client)
        end

        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap({ k = "gs", v = "<cmd>Lspsaga peek_definition<CR>", opt = opts }
        , { k = "gd", v = "<cmd>Lspsaga goto_definition<CR>", opt = opts }
        , { k = "gk", v = vim.lsp.buf.hover, opt = opts }
        , { k = "gi", v = "<cmd>Lspsaga finder<CR>", opt = opts }
        , { k = "gj", v = "<cmd>Lspsaga rename<CR>", opt = opts }
        , { k = "sa", v = "<cmd>Lspsaga code_action<CR>", opt = opts }
        , { k = "<leader>o", v = "<cmd>Lspsaga show_workspace_diagnostics<CR>", opt = opts }
        , { k = "<leader>=", v = "<cmd>Lspsaga diagnostic_jump_next<cr>", opt = opts }
        , { k = "<leader>-", v = "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt = opts }
        , { k = "<leader>m", v = "<cmd>Lspsaga outline<CR>", opt = opts }
        , { mod = "i", k = "<C-l>", v = vim.lsp.buf.signature_help, opt = opts }
        , { k = "sG", v = "<cmd>Lspsaga term_toggle<CR>", opt = opts }
        , { k = "<A-r>", v = "<cmd>nohlsearch<CR>", opt = opts }
        )
        if config.auto_format then
            lsp.buffer_autoformat()
        end

        if config.on_attach then
            config.on_attach(client, bufnr)
        end
    end)
    lsp.setup()
end)
