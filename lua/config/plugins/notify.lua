return {
    'rcarriga/nvim-notify',
    config = function()
        vim.notify = require("notify")
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
