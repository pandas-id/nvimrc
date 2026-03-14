return {
	"Kicamon/markdown-table-mode.nvim",
	ft = "markdown",
	config = function()
		require("markdown-table-mode").setup({
			filetype = {
				"*.md",
			},
			options = {
				insert = true,
				insert_leave = true,
				pad_separator_line = false,
				alig_style = "default",
			},
		})
	end,
}
