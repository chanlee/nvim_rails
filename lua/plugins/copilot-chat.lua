return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			-- copilot.lua는 이미 copilot-cmp.lua에서 설정되어 있으므로
			-- 여기서는 의존성만 명시
		},
	},
	config = function()
		require("CopilotChat").setup({
			-- 기본 설정
			debug = false,
			-- 기본 프롬프트에 한국어 응답 요청 추가
			model = "claude-3.7-sonnet",
			-- 모든 응답을 한국어로 요청하는 시스템 프롬프트
			system_prompt = "모든 응답은 한국어로 해주세요. 코드 설명, 리뷰, 수정 사항 등을 한국어로 제공해주세요.",
			-- 프롬프트 템플릿 (모든 답변은 한국어로)
			prompts = {
				Explain = {
					prompt = "/COPILOT_EXPLAIN 다음 코드가 어떻게 작동하는지 한국어로 설명해주세요.",
					mapping = "<leader>ce",
					description = "코드 설명",
				},
				Review = {
					prompt = "/COPILOT_REVIEW 다음 코드를 검토하고 개선 사항을 한국어로 제안해주세요.",
					mapping = "<leader>cr",
					description = "코드 리뷰",
				},
				Fix = {
					prompt = "/COPILOT_GENERATE 다음 코드를 올바르게 작동하도록 수정해주세요. 답변은 한국어로 해주세요.",
					mapping = "<leader>cf",
					description = "코드 수정",
				},
				Optimize = {
					prompt = "/COPILOT_GENERATE 다음 코드의 성능과 가독성을 개선해주세요. 답변은 한국어로 해주세요.",
					mapping = "<leader>co",
					description = "코드 최적화",
				},
				Docs = {
					prompt = "/COPILOT_GENERATE 다음 코드에 대한 문서(주석)를 추가해주세요. 답변은 한국어로 해주세요.",
					mapping = "<leader>cd",
					description = "문서 생성",
				},
				Tests = {
					prompt = "/COPILOT_GENERATE 다음 코드에 대한 테스트를 생성해주세요. 답변은 한국어로 해주세요.",
					mapping = "<leader>ct",
					description = "테스트 생성",
				},
				FixDiagnostic = {
					prompt = "/COPILOT_GENERATE 다음 진단 오류를 수정하는데 도움을 주세요. 답변은 한국어로 해주세요:",
					mapping = "<leader>cF",
					description = "진단 오류 수정",
				},
				Commit = {
					prompt = "/COPILOT_GENERATE 다음 변경사항에 대한 컨벤셔널 커밋 메시지를 한국어로 작성해주세요:",
					mapping = "<leader>cC",
					description = "커밋 메시지 생성",
				},
			},
		})

		-- 추가 키맵 설정
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- 채팅 창 열기/닫기
		keymap("n", "<leader>cc", "<cmd>CopilotChat<cr>", opts)
		keymap("n", "<leader>cC", "<cmd>CopilotChatClose<cr>", opts)

		-- 선택된 텍스트와 함께 채팅
		keymap("v", "<leader>cc", "<cmd>CopilotChat<cr>", opts)

		-- 퀵 액션들
		keymap("n", "<leader>ce", "<cmd>CopilotChatExplain<cr>", opts)
		keymap("n", "<leader>cr", "<cmd>CopilotChatReview<cr>", opts)
		keymap("n", "<leader>cf", "<cmd>CopilotChatFix<cr>", opts)
		keymap("n", "<leader>co", "<cmd>CopilotChatOptimize<cr>", opts)
		keymap("n", "<leader>cd", "<cmd>CopilotChatDocs<cr>", opts)
		keymap("n", "<leader>ct", "<cmd>CopilotChatTests<cr>", opts)
		keymap("n", "<leader>cF", "<cmd>CopilotChatFixDiagnostic<cr>", opts)
		keymap("n", "<leader>cC", "<cmd>CopilotChatCommit<cr>", opts)

		-- 비주얼 모드에서도 사용 가능
		keymap("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", opts)
		keymap("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", opts)
		keymap("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", opts)
		keymap("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", opts)
		keymap("v", "<leader>cd", "<cmd>CopilotChatDocs<cr>", opts)
		keymap("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", opts)
		keymap("v", "<leader>cF", "<cmd>CopilotChatFixDiagnostic<cr>", opts)
		keymap("v", "<leader>cC", "<cmd>CopilotChatCommit<cr>", opts)
	end,
}
