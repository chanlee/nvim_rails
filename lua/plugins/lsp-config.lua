local keyMapper = require("utils.keyMapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "biome", "pylsp", "solargraph", "ts_ls", "rust_analyzer" },
				-- rust_analyzer는 rustaceanvim이 자체적으로 attach하므로 자동 enable에서 제외
				automatic_enable = { exclude = { "rust_analyzer" } },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("solargraph", {
				settings = {
					solargraph = {
						diagnostics = true,
						completion = true,
						formatting = true,
					},
				},
			})
			vim.lsp.enable({ "lua_ls", "biome", "pylsp", "solargraph", "ts_ls" })

			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}

