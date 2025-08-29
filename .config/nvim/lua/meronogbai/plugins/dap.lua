return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				lazy = true,
				-- builds a copy of vscode-js-debug
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out && git restore package-lock.json",
			},
		},
		config = function()
			local dap = require("dap")
			local dap_vscode_utils = require("dap-vscode-js.utils")

			require("dap-vscode-js").setup({
				adapters = { "pwa-node" },
				debugger_path = dap_vscode_utils.join_paths(
					dap_vscode_utils.get_runtime_dir(),
					"/lazy/vscode-js-debug"
				),
			})

			for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start new debugging session" })
			vim.keymap.set("n", "<leader>dsv", dap.step_over)
			vim.keymap.set("n", "<leader>dsi", dap.step_into)
			vim.keymap.set("n", "<leader>dso", dap.step_out)
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set conditional breakpoint" })

			local dapui = require("dapui")
			dapui.setup()
			vim.keymap.set("n", "<leader>do", dapui.open)
			vim.keymap.set("n", "<leader>dl", dapui.close)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			require("nvim-dap-virtual-text").setup()
		end,
	},
}
