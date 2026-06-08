return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local ensure_installed = { "html", "blade", "php", "python" }

		require("nvim-treesitter").install(ensure_installed)
	end,
}
