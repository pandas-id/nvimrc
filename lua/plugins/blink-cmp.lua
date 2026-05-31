return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip").filetype_extend("html", { "python", "html" })
				end,
			},
		},
	},

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "scroll_documentation_down", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
			-- Custom kind icons for a cleaner look
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
			},
		},

		completion = {
			-- Show completion menu automatically
			menu = {
				border = "rounded",
				scrollbar = true,
				scrolloff = 2,
				-- Styling for the menu
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
					-- Add some padding and styling
					treesitter = { "lsp" },
				},
				-- Position and sizing
				max_height = 15,
			},

			-- Documentation popup styling
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					max_width = 80,
					max_height = 20,
				},
			},

			-- Ghost text preview
			ghost_text = {
				enabled = false,
			},

			-- Accept behavior
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			-- Highlight matched characters
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},

		-- Signature help styling
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				max_height = 10,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- Per source configuration
			providers = {
				lsp = {
					name = "LSP",
					fallbacks = { "buffer" },
				},
				path = {
					name = "Path",
				},
				snippets = {
					name = "Snip",
				},
				buffer = {
					name = "Buf",
					max_items = 5,
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
	opts_extend = { "sources.default" },
}

