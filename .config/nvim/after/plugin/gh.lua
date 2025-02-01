-- Opens the commit that last updated the current line in github
-- Depends on the `gh` cli
vim.keymap.set('n', '<leader>pr', function()
  local lineNum = vim.api.nvim__buf_stats(0).current_lnum
  local fileName = vim.fn.expand('%')
  local commitHashCommand = 'git blame -L' .. lineNum .. ',' .. lineNum .. ' ' .. fileName .. " | awk '{print $1}'"

  local command = 'gh browse `' .. commitHashCommand .. '`'

  -- Execute the command and capture the output
  local result = vim.fn.system(command)

  -- Check the exit code to determine success or failure
  if vim.v.shell_error == 0 then
    -- Log success
    print("Successfully opened commit in GitHub!")
  else
    -- Log failure and show the error message
    print("Failed to open commit in GitHub!")
    print("Error: " .. result)
  end
end, { desc = 'Open commit in github' })

vim.keymap.set('n', '<leader>ro', function()
  local command = 'gh browse'

  -- Execute the command and capture the output
  local result = vim.fn.system(command)

  -- Check the exit code to determine success or failure
  if vim.v.shell_error == 0 then
    -- Log success
    print("Successfully opened repo!")
  else
    -- Log failure and show the error message
    print("Failed to find repo!")
    print("Error: " .. result)
  end
end, { desc = 'Open repo in github' })
