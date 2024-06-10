return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.esupports.metagen"] = {
                config = {
                    timezone = "implicit-local"
                }
            },
            ["core.concealer"] = {
                config = {
                    icons = {
                        code_block = {
                            conceal = true,
                        }
                    }
                }
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/Documents/nodes"
                    },
                    default_workspace = "notes",
                    index = "index.norg",
                }
            },
            ["core.summary"] = {},
            ["core.export"] = {},
            ["core.export.markdown"] = {},
        }
    },
    dependencies = {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true
    }
}
