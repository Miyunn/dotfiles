return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- 1. Apply global defaults (capabilities) to ALL servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- 2. Apply server-specific settings (merges with the global "*" config)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- 3. Explicitly enable the servers you want to run
			vim.lsp.enable({ "ts_ls", "solargraph", "html", "lua_ls" })

			-- 4. Keymaps
			-- Note: In Neovim 0.11+, 'K' is natively mapped to hover by default,
			-- but we preserve your custom leader keymaps here.
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
