local dap = require('dap')

vim.keymap.set('n', '<leader>dct', dap.continue, { desc = "Start new debugging session" })
vim.keymap.set('n', '<leader>dsv', dap.step_over)
vim.keymap.set('n', '<leader>dsi', dap.step_into)
vim.keymap.set('n', '<leader>dso', dap.step_out)
vim.keymap.set('n', '<leader>dtb', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dtB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>dsb', dap.set_breakpoint)
vim.keymap.set('n', '<leader>lp',
  function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>dl', dap.run_last)

local widgets = require('dap.ui.widgets');
vim.keymap.set({ 'n', 'v' }, '<leader>dh', widgets.hover)
vim.keymap.set({ 'n', 'v' }, '<leader>dp', widgets.preview)
vim.keymap.set('n', '<leader>df', function()
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
  widgets.centered_float(widgets.scopes)
end)

require('mason').setup()
require('mason-nvim-dap').setup({
  ensure_installed = { 'js', 'node2' },
  -- leave empty or debugging typescript won't work for reasons beyond me :(
  handlers = {}
})

local dapui = require('dapui')
dapui.setup()

vim.keymap.set('n', '<leader>do', dapui.open)
vim.keymap.set('n', '<leader>dcl', dapui.close)

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
