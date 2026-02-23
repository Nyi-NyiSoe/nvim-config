return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- REQUIRED dependency
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup UI
		dapui.setup()

		-- Auto open/close UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Keymaps
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dc", dap.continue)
	end,
}
