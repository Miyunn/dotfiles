return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
		-- or "nvim-tree/nvim-web-devicons"
	},
	lazy = false,
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
			is_hidden_file = function(name, bufnr)
				return false -- never hide files
			end,
			is_always_hidden = function(name, bufnr)
				return false -- never hide dirs
			end,
		},
	},
}
