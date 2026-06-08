return {
	"saghen/blink.cmp",
	dependencies = {
		{
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
	},
	version = "1.*",

	config = function(_, opts)
		-- Highlight overrides
		vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
		vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#378ADD", bold = true })
		vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
		vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
		vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })

		require("blink.cmp").setup(opts)
	end,

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- Disable completion in comment nodes and for specific filetypes
		-- Recipe: "Dynamically picking providers by treesitter node/filetype"
		-- Recipe: "Disable per filetype/buffer"
		sources = {
			default = function(ctx)
				local ok, node = pcall(vim.treesitter.get_node)
				if ok and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
					return { "buffer" }
				end
				return { "lsp", "path", "snippets", "buffer" }
			end,

			-- Minimum keyword length per filetype
			-- Recipe: "Set minimum keyword length by filetype"
			min_keyword_length = function()
				return vim.bo.filetype == "markdown" and 2 or 0
			end,

			providers = {
				lsp = {
					name = "LSP",
					fallbacks = { "buffer" },
					-- Filter out keywords/constants from LSP (if, else, while, etc.)
					-- Recipe: "Exclude keywords/constants from autocomplete"
					transform_items = function(_, items)
						return vim.tbl_filter(function(item)
							return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
						end, items)
					end,
				},

				path = {
					name = "Path",
					-- Complete paths relative to cwd instead of current buffer dir
					-- Recipe: "Path completion from cwd instead of current buffer's directory"
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},

				snippets = {
					name = "Snip",
					-- Hide snippets when triggered after a trigger character (e.g. `.`, `"`)
					-- Recipe: "Hide snippets after trigger character"
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= "trigger_character"
					end,
				},

				buffer = {
					name = "Buf",
					min_keyword_length = 3,
					max_items = 5,
					-- Complete from all normal (non-special) buffers
					-- Recipe: "Buffer completion from all open buffers"
					opts = {
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},
			},
		},

		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "scroll_documentation_down", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			-- Accept without opening the menu if only one candidate exists
			-- Recipe: "Accept a completion without visual feedback"
			["<C-y>"] = {
				function(cmp)
					return cmp.show_and_insert_or_accept_single({ force = true })
				end,
				"fallback",
			},
		},

		appearance = {
			nerd_font_variant = "mono",
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
			menu = {
				border = "rounded",
				scrollbar = true,
				scrolloff = 2,
				max_height = 15,

				-- Avoid menu overlapping multi-line ghost text by flipping direction
				-- Recipe: "Avoid multi-line completion ghost text"
				direction_priority = function()
					local ctx = require("blink.cmp").get_context()
					local item = require("blink.cmp").get_selected_item()
					if ctx == nil or item == nil then
						return { "s", "n" }
					end

					local text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
					local multi_line = text:find("\n") ~= nil

					if multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
						vim.g.blink_cmp_upwards_ctx_id = ctx.id
						return { "n", "s" }
					end
					return { "s", "n" }
				end,

				draw = {
					columns = {
						{ "kind_icon", gap = 1 },
						{ "label", "label_description", gap = 1 },
						{ "kind", gap = 1 },
						{ "source_name" },
					},
					treesitter = { "lsp" },
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					max_width = 80,
					max_height = 20,
				},
			},

			-- Ghost text: inline preview styled via Comment highlight group
			ghost_text = {
				enabled = true,
				show_with_selection = true,
				show_without_selection = false,
				show_with_menu = true,
				show_without_menu = true,
			},

			accept = {
				auto_brackets = { enabled = true },
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},

		-- Experimental signature help
		signature = {
			enabled = true,
			trigger = {
				enabled = true,
				show_on_keyword = false,
				show_on_trigger_character = true,
				show_on_insert = false,
				show_on_insert_on_trigger_character = true,
			},
			window = {
				border = "rounded",
				max_width = 100,
				max_height = 10,
				scrollbar = false,
				treesitter_highlighting = true,
				show_documentation = true,
			},
		},

		fuzzy = {
			-- Always rank exact matches first
			-- Recipe: "Always prioritize exact matches"
			sorts = { "exact", "score", "sort_text" },
			implementation = "prefer_rust_with_warning",
		},
	},

	opts_extend = { "sources.default" },
}
