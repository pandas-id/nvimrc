return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "sindrets/diffview.nvim", lazy = true },
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		{ "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>Neogit push<cr>", desc = "Git push" },
	},
	config = function()
		require("neogit").setup({})
	end,
}
