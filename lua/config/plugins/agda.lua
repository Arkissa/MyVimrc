return {
    'isovector/cornelis',
    ft = { "agda" },
    build = "stack build",
    dependencies = {
        'neovimhaskell/nvim-hs.vim',
        'kana/vim-textobj-user'
    },
    config = function()
        O.addOpt {
            { "g", "cornelis_no_agda_input", 1 }
        }
        C.setup()
        vim.cmd [[
            au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"
        ]]
    end
}
