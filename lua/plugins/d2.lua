return {
    'terrastruct/d2-vim',
    ft = "d2",
    config = function()
        vim.g.d2_block_string_syntaxes = {
            d2 = { 'd2' },
            markdown = { 'md', 'markdown' },
            javascript = { 'javascript', 'js' },
            html = { 'html' },
            json = { 'json' },
            c = { 'c' },
            go = { 'go' },
            sh = { 'sh', 'zsh', 'bash' },
            css = { 'css' },
            vim = { 'vim' },
        }
    end
}
