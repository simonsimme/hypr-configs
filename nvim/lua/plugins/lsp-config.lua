return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
			config = function()
				require("mason-lspconfig").setup({
					automatic_enable = true,
					ensure_installed = {
						"lua_ls",
						"ts_ls",
						"jsonls",
						"html",
						"cssls",
						"jdtls",
						"sqlls",
						"hls",
						"pyright",
            "gopls"
					},
				})
			end,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
		--local capabilities = require("cmp_nvim_lsp").default_capabilities()
		 local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
      vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- prevent "undefined global 'vim'" warnings
						},
						workspace = {
							checkThirdParty = false, -- stops "do you want to configure .luarc.json" prompts
						},
						telemetry = { enable = false },
					},
				},
			})
			--vim.lsp.config('tsserver',{})
			--vim.lsp.enable('tsserver')
			--vim.lsp.enable("lua_ls")
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) --shift +k
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) --space + c+a
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show error" })
    
		end,
	},
}
