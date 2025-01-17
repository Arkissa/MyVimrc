vim.diagnostic.config {
	virtual_text = false,
	severity_sort = true,
	float = {
		border = 'rounded',
		scope = 'cursor',
	},
	signs = {
		text = {
		  [vim.diagnostic.severity.ERROR] = '✘',
		  [vim.diagnostic.severity.WARN] = '',
		  [vim.diagnostic.severity.HINT] = '',
		  [vim.diagnostic.severity.INFO] = '',
		},
		numhl = {
		  [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
		  [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
		  [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
		  [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
		},
	},
}

vim.keymap.set('n', '[e', function() vim.diagnostic.jump { count = -1, float = true } end)
vim.keymap.set('n', ']e', function() vim.diagnostic.jump { count = 1, float = true } end)
