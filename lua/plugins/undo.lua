return {
    "jiaoshijie/undotree",
    event = { "BufNewFile", "BufRead" },
    config = function()
        require 'undotree'.setup()
        if vim.fn.has("presistent_undo") then
            local target_path = vim.fn.expand('~/.config/nvim/.undodir')
            if vim.fn.isdirectory(target_path) then
                vim.fn.system("mkdir " .. target_path)
                vim.cmd("call mkdir('" .. target_path .. "', 'p', 0700)")
            end

            vim.o.undodir = target_path
            vim.cmd "set undofile"
        end

        vim.keymap { k = "<LEADER>uu", v = ":lua require('undotree').toggle()<CR>", opt = { silent = true } }
    end
}
