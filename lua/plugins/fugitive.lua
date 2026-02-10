-- lua/plugins/fugitive.lua
return {
	"tpope/vim-fugitive",
	cmd = {
		"Git",
		"Gstatus",
		"Gblame",
		"Gpush",
		"Gpull",
		"Gdiff",
		"Gcommit",
		"Gwrite",
		"Gread",
	},
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gd", "<cmd>Gdiff<cr>", desc = "Git diff" },
		{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
		{ "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git add current file" },
		{ "<leader>gt", "<cmd>Git add %<cr>", desc = "Git add current file (alternative)" },
		{ "<leader>gA", "<cmd>Git add .<cr>", desc = "Git add all files" },
	},
	config = function()
		vim.cmd([[
      set diffopt+=vertical
      autocmd FileType fugitive nmap <buffer> s :Git add %:p<CR>
      autocmd FileType fugitive nmap <buffer> u :Git reset HEAD %:p<CR>
    ]])

		vim.api.nvim_create_user_command("Gadd", function(opts)
			if opts.args and opts.args ~= "" then
				vim.cmd("Git add " .. opts.args)
			else
				vim.cmd("Gwrite")
			end
		end, { nargs = "?", desc = "Git add with optional path" })
	end,
}
