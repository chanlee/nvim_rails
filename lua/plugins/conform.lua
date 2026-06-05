return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				ruby = { "rubocop" },
				-- Rust: rust-analyzer 내장 rustfmt 사용 (LSP formatting fallback)
				rust = { lsp_format = "prefer" },
			},
			formatters = {
				rubocop = {
					prepend_args = { "--autocorrect-all" },
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
		-- 수동 포매팅 키 매핑 (markdown-preview <leader>mp와 충돌하므로 <leader>cf 사용)
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

