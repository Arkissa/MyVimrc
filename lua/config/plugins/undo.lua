return {
    "jiaoshijie/undotree",
    event = { "BufNewFile", "BufRead" },
    config = function()
        require('undotree').setup()
        if vim.fn.has("presistent_undo") then
            local target_path = vim.fn.expand('~/.config/nvim/.undodir')
            if vim.fn.isdirectory(target_path) then
                vim.fn.system("mkdir " .. target_path)
                vim.cmd("call mkdir('" .. target_path .. "', 'p', 0700)")
            end

            vim.o.undodir = target_path
            -- vim.cmd "set undodir"
            vim.cmd("set undofile")
        end

        K.addKeymap({
            { "n", "<LEADER>uu", ":lua require('undotree').toggle()<CR>", { silent = true } }
        })
    end
}
