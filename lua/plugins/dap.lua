return {
	"rcarriga/nvim-dap-ui",
	cmd = { "DapToggleBreakpoint", "DapContinue", "DapStepOver", "DapStepInto" },
	keys = {
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
		{ "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
		{ "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
		{ "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
		{ "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
	},
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
