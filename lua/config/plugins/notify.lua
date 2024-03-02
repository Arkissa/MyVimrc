return {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
        vim.notify = require "notify"
        vim.notify.setup {
            fps = 60,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                WARN = ""
            },
            minimum_width = 20,
            timeout = 3000,
            background_colour = "#000000",
        }
    end
}
