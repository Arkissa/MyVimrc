local myvimrc = augroup("MYVIMRC", {
	clear = false,
})

autocmd("BufReadPost", {
	group = myvimrc,
	callback = function (_)
		local line = vim.fn.line([['"]])
		local filetype = vim.opt.filetype:get()
		if  line > 1
			and line <= vim.fn.line("$")
			and not vim.tbl_contains({'xxd', 'gitrebase', 'tutor', 'commit'}, filetype)
		then
			vim.cmd [[normal! g'"]]
		end
	end
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = myvimrc,
	callback = function()
		vim.hl.on_yank()
	end,
})
