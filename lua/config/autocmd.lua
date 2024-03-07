vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.exists(":LspStart") > 0 then
            vim.cmd "LspStart"
        end
        vim.cmd "Neotree action=show toggle"
    end
})
