return {
	"CRAG666/code_runner.nvim",
	cmd = { "RunCode", "RunFile", "RunProject" },
	keys = {
		{ "<leader>rr", "<cmd>RunCode<cr>", desc = "Run code" },
		{ "<leader>rf", "<cmd>RunFile<cr>", desc = "Run file" },
	},
	config = function()
		require("code_runner").setup({
			mode = "term",
			better_term = {
				clean = false,
				number = nil,
				init = nil,
			},
			filetype = {
				python = "python3",
				rust = "cargo run",
				cpp = {
					"cd $dir &&",
					"g++ -o script $fileName && ./script",
				},
				c = "gcc -o script $fileName && ./script",
				asm = {
					"nasm -f elf64 -o output.o $fileName &&",
					"ld -o output output.o &&",
					"./output",
				},
				typescript = "npx tsc",
				php = "php $fileName",
				r = "Rscript $fileName",
			},
		})
	end,
}
