return {
	"dinhhuy258/sfm.nvim",
	cmd = "SFMToggle",
	keys = {
		{ "<c-n>", "<cmd>SFMToggle<cr>", desc = "Toggle file tree" },
	},
	dependencies = {
		{ "dinhhuy258/sfm-telescope.nvim", lazy = true },
	},
	config = function()
		local sfm = require("sfm").setup({
			view = {
				width = 40,
			},
		})
		sfm:load_extension("sfm-telescope")
	end,
}
