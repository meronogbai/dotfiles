-- Searches for the PR that last updated the current line in github
-- Depends on the `gh` cli
vim.keymap.set('n', '<leader>pr', function()
  local lineNum = vim.api.nvim__buf_stats(0).current_lnum
  local fileName = vim.fn.expand('%')
  local commitHashCommand = 'git blame -L' .. lineNum .. ',' .. lineNum .. ' ' .. fileName .. " | awk '{print $1}'"

  local command = 'gh search prs' ..
      ' `' .. commitHashCommand .. '`' .. " | awk '{print $2}' | xargs -I _ gh pr view --web _"

  -- Execute the command and capture the output
  local result = vim.fn.system(command)

  -- Check the exit code to determine success or failure
  if vim.v.shell_error == 0 then
    -- Log success
    print("Successfully found PR!")
  else
    -- Log failure and show the error message
    print("Failed to find PR!")
    print("Error: " .. result)
  end
end, { desc = 'Search for PR in github' })
