-- Searches for the PR that last updated the current line in github
-- Depends on the `gh` cli
vim.keymap.set('n', '<leader>pr', function()
  local lineNum = vim.api.nvim__buf_stats(0).current_lnum
  local fileName = vim.fn.expand('%')
  local commitHashCommand = 'git blame -L' .. lineNum .. ',' .. lineNum .. ' ' .. fileName .. " | awk '{print $1}'"

  vim.fn.system('gh search prs --web' .. ' `' .. commitHashCommand .. '`')
end)
