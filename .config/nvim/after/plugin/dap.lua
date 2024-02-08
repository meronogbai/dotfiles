local dap = require('dap')
local dap_vscode_utils = require("dap-vscode-js.utils")

-- JS/TS Debugging
require("dap-vscode-js").setup({
  adapters = { 'pwa-node' },
  debugger_path = dap_vscode_utils.join_paths(dap_vscode_utils.get_runtime_dir(), "/lazy/vscode-js-debug"), -- Path to vscode-js-debug installation.
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end

vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Start new debugging session" })
vim.keymap.set('n', '<leader>dsv', dap.step_over)
vim.keymap.set('n', '<leader>dsi', dap.step_into)
vim.keymap.set('n', '<leader>dso', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  { desc = 'Set conditional breakpoint' })
-- vim.keymap.set('n', '<leader>dsb', dap.set_breakpoint)
-- vim.keymap.set('n', '<leader>lp',
-- function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<leader>dr', dap.repl.open)
-- vim.keymap.set('n', '<leader>dl', dap.run_last)

-- local widgets = require('dap.ui.widgets');
-- vim.keymap.set({ 'n', 'v' }, '<leader>dh', widgets.hover)
-- vim.keymap.set({ 'n', 'v' }, '<leader>dp', widgets.preview)
-- vim.keymap.set('n', '<leader>df', function()
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<leader>ds', function()
--   widgets.centered_float(widgets.scopes)
-- end)

local dapui = require('dapui')
dapui.setup()

vim.keymap.set('n', '<leader>do', dapui.open)
vim.keymap.set('n', '<leader>dl', dapui.close)

-- Open automatically when a new debug session is created
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
