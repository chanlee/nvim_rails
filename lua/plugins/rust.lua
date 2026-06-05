-- Rust 개발 지원
-- - rustaceanvim: rust-analyzer LSP 통합 + DAP 연동 (rust-tools.nvim 후계)
-- - crates.nvim:  Cargo.toml 의존성 버전 표시/관리
--
-- rust-analyzer / codelldb 본체는 Mason이 설치합니다.
--   :MasonInstall rust-analyzer codelldb
-- rust_analyzer는 lsp-config.lua의 ensure_installed에 등록되어 있어 자동 설치되며,
-- codelldb는 첫 진입 시 mason-registry로 설치를 트리거합니다.

local function codelldb_paths()
	local mason_root = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension"
	local codelldb_bin = mason_root .. "/adapter/codelldb"
	-- macOS: liblldb.dylib, Linux: liblldb.so
	local liblldb = mason_root .. (vim.fn.has("mac") == 1 and "/lldb/lib/liblldb.dylib" or "/lldb/lib/liblldb.so")
	return codelldb_bin, liblldb
end

return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		ft = { "rust" },
		init = function()
			local codelldb_bin, liblldb = codelldb_paths()

			vim.g.rustaceanvim = {
				tools = {
					hover_actions = { auto_focus = true },
				},
				server = {
					on_attach = function(_, bufnr)
						local opts = { buffer = bufnr, silent = true }
						-- rustaceanvim 전용 액션
						vim.keymap.set("n", "<leader>rr", function()
							vim.cmd.RustLsp("runnables")
						end, vim.tbl_extend("force", opts, { desc = "Rust runnables" }))
						vim.keymap.set("n", "<leader>rd", function()
							vim.cmd.RustLsp("debuggables")
						end, vim.tbl_extend("force", opts, { desc = "Rust debuggables" }))
						vim.keymap.set("n", "<leader>rm", function()
							vim.cmd.RustLsp("expandMacro")
						end, vim.tbl_extend("force", opts, { desc = "Expand macro" }))
						vim.keymap.set("n", "<leader>rc", function()
							vim.cmd.RustLsp("openCargo")
						end, vim.tbl_extend("force", opts, { desc = "Open Cargo.toml" }))
						vim.keymap.set("n", "<leader>rp", function()
							vim.cmd.RustLsp("parentModule")
						end, vim.tbl_extend("force", opts, { desc = "Parent module" }))
					end,
					default_settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true, loadOutDirsFromCheck = true },
							check = { command = "clippy" },
							procMacro = { enable = true },
							inlayHints = {
								bindingModeHints = { enable = true },
								chainingHints = { enable = true },
								parameterHints = { enable = true },
								typeHints = { enable = true },
							},
						},
					},
				},
				dap = {
					adapter = {
						type = "server",
						port = "${port}",
						host = "127.0.0.1",
						executable = {
							command = codelldb_bin,
							args = { "--liblldb", liblldb, "--port", "${port}" },
						},
					},
				},
			}
		end,
		config = function()
			-- 첫 진입 시 codelldb가 없으면 Mason으로 자동 설치 시도
			local ok, registry = pcall(require, "mason-registry")
			if ok and registry.has_package("codelldb") then
				local pkg = registry.get_package("codelldb")
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = { enabled = true },
				},
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})

			-- Cargo.toml 버퍼 전용 키맵
			vim.api.nvim_create_autocmd("BufRead", {
				pattern = "Cargo.toml",
				callback = function()
					local crates = require("crates")
					local opts = { buffer = true, silent = true }
					vim.keymap.set("n", "<leader>ct", crates.toggle, vim.tbl_extend("force", opts, { desc = "Crates toggle" }))
					vim.keymap.set("n", "<leader>cu", crates.update_crate, vim.tbl_extend("force", opts, { desc = "Update crate" }))
					vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, vim.tbl_extend("force", opts, { desc = "Upgrade crate" }))
					vim.keymap.set("n", "<leader>ch", crates.open_homepage, vim.tbl_extend("force", opts, { desc = "Crate homepage" }))
					vim.keymap.set("n", "<leader>cR", crates.open_repository, vim.tbl_extend("force", opts, { desc = "Crate repository" }))
				end,
			})
		end,
	},
}
