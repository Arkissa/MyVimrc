require 'nvim-treesitter.configs'.setup {
	modules = {},
	ignore_install = {},
	ensure_installed = { "c",
					   "rust",
					   "latex",
					   "lua",
					   "vim",
					   "vimdoc",
					   "query",
					   "markdown",
					   "markdown_inline",
					   "python",
					   "go",
					   "gomod",
					   "luadoc",
					   "regex",
					   "make",
					   "printf",
					   "http",
					   "html",
					   "sql",
					   "nix",
					   "haskell",
					   "yaml",
					   "toml",
					   "proto",
					   "norg",
					   "css",
					   "sql",
					   "json",
					   "bash",
				   },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 100 * 1024
			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end

			return false
		end,

		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
		  init_selection = 'gnn',
		  -- below are vmap
		  node_incremental = 'gnk',
		  node_decremental = 'gnj',
		  scope_incremental = 'gna',
		},
	},
	indent = {
		enable = true,
	},
}
