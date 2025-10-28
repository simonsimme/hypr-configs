return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.prettier,
				-- 	null_ls.builtins.formatting.eslint_d,
				-- null_ls.builtins.diagnostics.ast_grep,
				null_ls.builtins.diagnostics.checkstyle,
				--	require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- space g f
	end,
}
