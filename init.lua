vim.loader.enable()

_G.augroup = vim.api.nvim_create_augroup
_G.autocmd = vim.api.nvim_create_autocmd
_G.packadd = vim.cmd.packadd

vim.g.markdown_syntax_conceal = 2
vim.g.kastemds_path = "~/kastemd"

packadd "cfilter"
