local M = {}

-- Git branch picker (simple checkout)
function M.git_branch_picker()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	-- Get git branches
	local handle = io.popen("git branch --format='%(refname:short)' 2>/dev/null")
	if not handle then
		vim.notify("Failed to get git branches", vim.log.levels.ERROR)
		return
	end
	
	local branches = {}
	for line in handle:lines() do
		if line ~= "" then
			table.insert(branches, line)
		end
	end
	handle:close()

	if #branches == 0 then
		vim.notify("No git branches found or not in a git repository", vim.log.levels.WARN)
		return
	end

	pickers.new({
		theme = require("telescope.themes").get_ivy(),
	}, {
		prompt_title = "Git Branches",
		finder = finders.new_table({
			results = branches,
		}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then
					local branch = selection[1]
					local result = vim.fn.system("git checkout " .. vim.fn.shellescape(branch))
					if vim.v.shell_error ~= 0 then
						vim.notify("Failed to checkout branch: " .. result, vim.log.levels.ERROR)
					else
						vim.notify("Switched to branch: " .. branch, vim.log.levels.INFO)
					end
				end
			end)
			return true
		end,
	}):find()
end

-- Git branch picker with stash (stash → switch → pop)
function M.git_branch_picker_with_stash()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	-- Get git branches
	local handle = io.popen("git branch --format='%(refname:short)' 2>/dev/null")
	if not handle then
		vim.notify("Failed to get git branches", vim.log.levels.ERROR)
		return
	end
	
	local branches = {}
	for line in handle:lines() do
		if line ~= "" then
			table.insert(branches, line)
		end
	end
	handle:close()

	if #branches == 0 then
		vim.notify("No git branches found or not in a git repository", vim.log.levels.WARN)
		return
	end

	pickers.new({
		theme = require("telescope.themes").get_ivy(),
	}, {
		prompt_title = "Git Branches (Stash → Switch → Pop)",
		finder = finders.new_table({
			results = branches,
		}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection then
					local branch = selection[1]
					
					-- Check if there are changes to stash
					local status_result = vim.fn.system("git status --porcelain")
					local has_changes = status_result ~= ""
					
					if has_changes then
						vim.notify("Stashing changes...", vim.log.levels.INFO)
						local stash_result = vim.fn.system("git stash push -m 'Auto-stash before branch switch'")
						if vim.v.shell_error ~= 0 then
							vim.notify("Failed to stash changes: " .. stash_result, vim.log.levels.ERROR)
							return
						end
					end
					
					-- Switch branch
					vim.notify("Switching to branch: " .. branch, vim.log.levels.INFO)
					local switch_result = vim.fn.system("git switch " .. vim.fn.shellescape(branch))
					if vim.v.shell_error ~= 0 then
						vim.notify("Failed to switch branch: " .. switch_result, vim.log.levels.ERROR)
						return
					end
					
					-- Pop stash if we stashed changes
					if has_changes then
						vim.notify("Popping stashed changes...", vim.log.levels.INFO)
						local pop_result = vim.fn.system("git stash pop")
						if vim.v.shell_error ~= 0 then
							vim.notify("Warning: Failed to pop stash: " .. pop_result, vim.log.levels.WARN)
						else
							vim.notify("Successfully switched to " .. branch .. " and restored changes", vim.log.levels.INFO)
						end
					else
						vim.notify("Successfully switched to branch: " .. branch, vim.log.levels.INFO)
					end
				end
			end)
			return true
		end,
	}):find()
end

return M