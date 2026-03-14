---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	cmd = "Yazi",
	dependencies = {
		{ "folke/snacks.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>y",
			"<cmd>Yazi<cr>",
			mode = { "n", "v" },
			desc = "Open yazi at current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open yazi in working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
