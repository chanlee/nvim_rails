return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"suketa/nvim-dap-ruby",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		require("dapui").setup()
		require("dap-ruby").setup()
		-- Python: 시스템 python3 사용. venv가 활성화돼 있으면 자동 감지됨.
		-- debugpy는 Mason 또는 `pip install debugpy`로 설치 필요.
		require("dap-python").setup("python3")

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
