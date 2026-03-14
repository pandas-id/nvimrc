return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	keys = {
		{ "<leader>sr", "<cmd>Spectre<cr>", desc = "Search and Replace" },
	},
	config = function()
		require("spectre").setup()
	end,
}
