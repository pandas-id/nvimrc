local options = {}

options.config = function()
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "│" },
			topdelete = { text = "│" },
			changedelete = { text = "│" },
			untracked = { text = "│" },
		},
	})
end

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	config = options.config,
}
