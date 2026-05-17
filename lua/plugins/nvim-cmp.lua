return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile", "InsertEnter" },
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-x>"] = cmp.mapping.complete(), -- 자동완성 트리거
					["<C-e>"] = cmp.mapping.abort(),
					["<Esc>"] = cmp.mapping.close(), -- ESC로 자동완성 닫기
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter로 선택 확인
					["<C-n>"] = cmp.mapping.select_next_item(), -- 다음 항목 선택
					["<C-p>"] = cmp.mapping.select_prev_item(), -- 이전 항목 선택
					-- 스니펫 전용 키맵 (Copilot과 겹치지 않도록 변경)
					["<C-d>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-u>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- autocompletion sources
				-- Copilot 인라인 제안은 copilot.lua에서 수동 트리거(<C-]>)로만 동작하도록 설정.
				-- cmp 팝업의 copilot 소스는 입력 시 자동 노출되므로 제거.
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 2 }, -- lsp
					{ name = "buffer", max_item_count = 5, group_index = 2 }, -- text within current buffer
					{ name = "path", max_item_count = 3, group_index = 2 }, -- file system paths
					{ name = "luasnip", max_item_count = 3, group_index = 2 }, -- snippets
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						require("copilot_cmp.comparators").prioritize,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
}

