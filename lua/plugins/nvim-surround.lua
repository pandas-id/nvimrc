return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-surround").setup({})
	end,
}
