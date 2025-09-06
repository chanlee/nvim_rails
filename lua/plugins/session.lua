return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/workspace", "~/labs", "/" },
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_create_enabled = true,
			auto_session_allowed_dirs = nil, -- 모든 디렉토리에서 세션 생성 허용
			session_lens = {
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
			-- 세션 저장 시 더 많은 정보 포함
			pre_save_cmds = {
				function()
					-- 현재 작업 디렉토리 저장
					vim.g.auto_session_pre_save_cwd = vim.fn.getcwd()
				end,
			},
			post_restore_cmds = {
				function()
					-- 세션 복원 후 작업 디렉토리 복원
					if vim.g.auto_session_pre_save_cwd then
						vim.cmd("cd " .. vim.g.auto_session_pre_save_cwd)
					end
				end,
			},
		})

		-- 세션 관리를 위한 키맵들
		vim.keymap.set("n", "<leader>ls", "<cmd>AutoSession search<CR>", {
			noremap = true,
			desc = "Load Session",
		})
		
		vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession save<CR>", {
			noremap = true,
			desc = "Save Session",
		})
		
		vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<CR>", {
			noremap = true,
			desc = "Restore Session",
		})
		
		vim.keymap.set("n", "<leader>sd", "<cmd>AutoSession delete<CR>", {
			noremap = true,
			desc = "Delete Session",
		})
		
		-- 세션 자동 저장 강제 실행
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				-- 현재 디렉토리가 suppress_dirs에 포함되지 않은 경우에만 저장
				local cwd = vim.fn.getcwd()
				local suppress_dirs = { vim.fn.expand("~/"), vim.fn.expand("~/workspace"), vim.fn.expand("~/labs"), "/" }
				local should_save = true
				
				for _, dir in ipairs(suppress_dirs) do
					if cwd == dir or cwd:find("^" .. vim.pesc(dir)) then
						should_save = false
						break
					end
				end
				
				if should_save then
					require("auto-session").SaveSession()
				end
			end,
		})
	end,
}
