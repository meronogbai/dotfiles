-- Opens the PR/commit that last updated the current line in github
vim.keymap.set('n', '<leader>ghp', function()
  local lineNum = vim.api.nvim__buf_stats(0).current_lnum
  local fileName = vim.fn.expand('%')
  local commitHashCommand = 'git blame -L' .. lineNum .. ',' .. lineNum .. ' ' .. fileName .. " | awk '{print $1}'"

  -- Get the commit hash
  local commitHash = vim.fn.system(commitHashCommand):gsub('\n', '')

  -- Check if the command was successful
  if vim.v.shell_error ~= 0 or commitHash == "" or commitHash:match("^0+$") then
    print("❌ No valid commit found for this line!")
    return
  end

  -- Check if the commit is part of a PR
  local prCheckCommand = 'gh pr list -s all --search ' .. commitHash .. ' --json number --jq \'map(.number) | @sh\''
  local prNumbersStr = vim.fn.system(prCheckCommand):gsub('\n', '')

  -- Extract PR numbers from shell-quoted output
  local prNumbers = {}
  for pr in prNumbersStr:gmatch("%d+") do
    table.insert(prNumbers, pr)
  end

  if #prNumbers > 0 then
    -- Open all found PRs
    for _, prNumber in ipairs(prNumbers) do
      local prViewCommand = 'gh pr view ' .. prNumber .. ' --web'
      vim.fn.system(prViewCommand)
    end
    print("✅ Successfully opened PR(s) in GitHub: " .. table.concat(prNumbers, ", "))
  else
    -- No PR found, open the commit instead
    local browseCommand = 'gh browse ' .. commitHash
    local browseResult = vim.fn.system(browseCommand)

    if vim.v.shell_error == 0 then
      print("✅ Successfully opened commit in GitHub!")
    else
      print("❌ Failed to open commit: " .. browseResult)
    end
  end
end, { desc = 'Open PR(s) or commit in GitHub' })

-- Opens the repo in github
vim.keymap.set('n', '<leader>ghr', function()
  local command = { 'gh', 'repo', 'view', '--web' }

  vim.system(command, { text = true }, function(obj)
    if obj.code == 0 then
      print("✅ Successfully opened repo!")
    else
      print("❌ Failed to open repo!")
    end
  end)
end, { desc = 'Open repo in GitHub' })

-- Opens the current file in github
vim.keymap.set('n', '<leader>ghf', function()
  local filePath = vim.fn.expand('%')

  -- Use gh browse to open the file in GitHub
  local command = { 'gh', 'browse', filePath }

  vim.system(command, { text = true }, function(obj)
    if obj.code == 0 then
      print("✅ Successfully opened file!")
    else
      print("❌ Failed to open file in GitHub: " .. (obj.stderr or ""))
    end
  end)
end, { desc = 'Open current file in GitHub' })
