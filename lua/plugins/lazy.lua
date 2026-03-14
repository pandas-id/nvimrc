-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	-- Core dependencies (lazy loaded when needed)
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "kevinhwang91/promise-async", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },

	-- Time tracking (needs to load early)
	{ "wakatime/vim-wakatime", event = "VeryLazy" },

	-- Colorschemes (only one should be active)
	-- require("plugins.kanagawa-paper"),
	require("plugins.everblush"),

	-- Search & Replace
	require("plugins.spectre"),

	-- Fuzzy finder
	require("plugins.telescope"),

	-- File explorers
	require("plugins.sfm"),
	require("plugins.oil"),
	require("plugins.yazi"),

	-- Editing essentials
	require("plugins.mini-pairs"),
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	require("plugins.nvim-surround"),

	-- Completion & Snippets
	require("plugins.blink-cmp"),

	-- Auto save
	require("plugins.autosave"),

	-- Syntax & Parsing
	require("plugins.treesitter"),

	-- Code execution
	require("plugins.code_runner"),

	-- Motion
	require("plugins.flash"),

	-- Git
	require("plugins.gitsigns"),
	require("plugins.neogit"),

	-- LSP
	require("plugins.lspsaga"),
	require("plugins.conform"),

	-- AI
	require("plugins.codecompanion"),
	require("plugins.copilot"),

	-- Keybinding help
	require("plugins.which-key"),

	-- Demo/Recording
	require("plugins.screenkey"),

	-- Folding
	require("plugins.nvim-ufo"),

	-- Framework specific
	require("plugins.flutter"),
	require("plugins.laravel"),

	-- Visual enhancements
	require("plugins.hlchunk"),
	require("plugins.lualine"),
	require("plugins.colorizer"),

	-- Comments & Notes
	require("plugins.todo-comments"),

	-- Markdown
	require("plugins.markdown-table-mode"),
	require("plugins.render-markdown"),

	-- Debugging
	require("plugins.dap"),

	-- UI enhancements
	require("plugins.noice"),
})
