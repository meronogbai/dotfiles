-- Spinner utility function
local function with_spinner(task, message)
	local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local frame_index = 1
	local timer = nil

	-- Start the spinner
	timer = vim.loop.new_timer()
	timer:start(
		0,
		100,
		vim.schedule_wrap(function()
			vim.api.nvim_echo({ { message .. " " .. frames[frame_index], "Normal" } }, false, {})
			frame_index = (frame_index % #frames) + 1
		end)
	)

	-- Function to stop the spinner
	local function stop_spinner()
		if timer then
			timer:stop()
			timer:close()
			timer = nil
		end
		vim.schedule(function()
			vim.api.nvim_echo({ { "" } }, false, {}) -- Clear the message
		end)
	end

	-- Execute the task
	task(stop_spinner)
end

-- Opens the PR/commit that last updated the current line in github
vim.keymap.set("n", "<leader>ghp", function()
	local lineNum = vim.api.nvim_win_get_cursor(0)[1]
	local fileName = vim.fn.expand("%:p")

	with_spinner(function(done)
		-- Get the commit hash asynchronously
		vim.system(
			{ "git", "blame", "-L", tostring(lineNum) .. "," .. tostring(lineNum), "--", fileName },
			{ text = true },
			function(obj)
				local blameOutput = obj.stdout or ""
				local commitHash = blameOutput:match("^%S+")

				if obj.code ~= 0 or not commitHash or commitHash:match("^0+$") then
					done()
					print("❌ No valid commit found for this line!")
					return
				end

				-- Check if the commit is part of a PR
				vim.system({
					"gh",
					"pr",
					"list",
					"-s",
					"all",
					"--search",
					commitHash,
					"--json",
					"number",
					"--jq",
					".[].number",
				}, { text = true }, function(pr_obj)
					local prNumbersStr = (pr_obj.stdout or ""):gsub("\n", "")

					-- Extract PR numbers from the gh JSON query output
					local prNumbers = {}
					for pr in prNumbersStr:gmatch("%d+") do
						table.insert(prNumbers, pr)
					end

					if #prNumbers > 0 then
						-- Open all found PRs
						local opened = 0
						local total = #prNumbers

						for _, prNumber in ipairs(prNumbers) do
							vim.system({ "gh", "pr", "view", prNumber, "--web" }, { text = true }, function(view_obj)
								opened = opened + 1
								if opened == total then
									done()
									print("✅ Successfully opened PR(s) in GitHub: " .. table.concat(prNumbers, ", "))
								end
							end)
						end
					else
						-- No PR found, open the commit instead
						vim.system({ "gh", "browse", commitHash }, { text = true }, function(browse_obj)
							done()
							if browse_obj.code == 0 then
								print("✅ Successfully opened commit in GitHub!")
							else
								print("❌ Failed to open commit: " .. (browse_obj.stderr or ""))
							end
						end)
					end
				end)
			end
		)
	end, "Opening GitHub PR/commit")
end, { desc = "Open PR(s) or commit in GitHub" })

-- Opens the repo in github
vim.keymap.set("n", "<leader>ghr", function()
	local command = { "gh", "repo", "view", "--web" }

	with_spinner(function(done)
		vim.system(command, { text = true }, function(obj)
			done()
			if obj.code == 0 then
				print("✅ Successfully opened repo!")
			else
				print("❌ Failed to open repo!")
			end
		end)
	end, "Opening GitHub repo")
end, { desc = "Open repo in GitHub" })

-- Opens the current file in github
vim.keymap.set("n", "<leader>ghf", function()
	local filePath = vim.fn.expand("%")
	local lineNum = vim.api.nvim__buf_stats(0).current_lnum

	-- Get the current Git branch
	local branch_cmd = vim.fn.system("git branch --show-current")
	local branch = vim.fn.trim(branch_cmd)

	-- Use gh browse to open the file in GitHub with the current branch
	local command = { "gh", "browse" }

	-- Add branch flag if we successfully got a branch name
	if branch ~= "" and vim.v.shell_error == 0 then
		table.insert(command, "--branch")
		table.insert(command, branch)
	end

	table.insert(command, filePath .. ":" .. lineNum)

	with_spinner(function(done)
		vim.system(command, { text = true }, function(obj)
			done()
			if obj.code == 0 then
				print("✅ Successfully opened file at branch!")
			else
				print("❌ Failed to open file in GitHub: " .. (obj.stderr or ""))
			end
		end)
	end, "Opening file in GitHub")
end, { desc = "Open current file in GitHub at current branch" })
