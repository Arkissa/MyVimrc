require "oil".setup {
	columns = {
		"permissions",
		"size",
		"mtime",
		"icon",
	},
	keymaps = {
		["<C-s>"] = { "actions.select", opts = { vertical = true, split = "belowright" } },
	},
}
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
