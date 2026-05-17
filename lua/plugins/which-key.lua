return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 300,
		spec = {
			{ "<leader>c", group = "Code / Conform" },
			{ "<leader>d", group = "Debug (DAP)" },
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>g", group = "Git (fugitive)" },
			{ "<leader>h", group = "Hunk (gitsigns)" },
			{ "<leader>ht", group = "Hunk toggle" },
			{ "<leader>m", group = "Markdown / Misc" },
			{ "<leader>q", group = "Buffer close" },
			{ "<leader>s", group = "Session" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
