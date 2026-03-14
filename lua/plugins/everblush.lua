return {
	"Everblush/nvim",
	name = "everblush",
	lazy = false,
	priority = 1000,
	config = function()
		require("everblush").setup({
			override = {},
			transparent_background = true,
			nvim_tree = {
				contrast = true,
			},
		})
		vim.cmd.colorscheme("everblush")
	end,
}
