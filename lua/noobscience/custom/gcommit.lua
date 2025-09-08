local M = {}

-- Function to run gcommit and get the result
local function run_gcommit()
  local handle = io.popen("gcommit 2>&1")
  if not handle then
    vim.notify("Failed to run gcommit command", vim.log.levels.ERROR)
    return nil
  end

  local result = handle:read("*a")
  local success = handle:close()

  if not success then
    vim.notify("gcommit command failed: " .. result, vim.log.levels.ERROR)
    return nil
  end

  -- Trim whitespace
  result = result:gsub("^%s*(.-)%s*$", "%1")

  if result == "" then
    vim.notify("gcommit returned empty result", vim.log.levels.WARN)
    return nil
  end

  return result
end

-- GcommitCopy: Copy gcommit result to clipboard
function M.gcommit_copy()
  local commit_msg = run_gcommit()
  if not commit_msg then
    return
  end

  -- Copy to clipboard using pbcopy
  local handle = io.popen("pbcopy", "w")
  if not handle then
    vim.notify("Failed to access clipboard", vim.log.levels.ERROR)
    return
  end

  handle:write(commit_msg)
  handle:close()

  vim.notify("Commit message copied to clipboard: " .. commit_msg, vim.log.levels.INFO)
end

-- Gcommit: Run gcommit and prefill Git commit
function M.gcommit()
  local commit_msg = run_gcommit()
  if not commit_msg then
    return
  end

  -- Check if we're in a git repository
  local git_check = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repository", vim.log.levels.ERROR)
    return
  end

  -- Use Git commit command with prefilled message
  -- Escape the commit message for command line
  local escaped_msg = vim.fn.shellescape(commit_msg)
  vim.cmd("Git commit -m " .. escaped_msg)

  vim.notify("Git commit initiated with message: " .. commit_msg, vim.log.levels.INFO)
end

-- Setup function to register commands and keybindings
function M.setup()
  -- Register commands
  vim.api.nvim_create_user_command('GcommitCopy', M.gcommit_copy, {
    desc = 'Generate commit message with gcommit and copy to clipboard'
  })

  vim.api.nvim_create_user_command('Gcommit', M.gcommit, {
    desc = 'Generate commit message with gcommit and prefill Git commit'
  })

  -- Set keybindings
  local keymap = vim.keymap.set
  keymap("n", "<leader>gc", M.gcommit_copy, { desc = "Generate commit message and copy to clipboard" })
  keymap("n", "<leader>gC", M.gcommit, { desc = "Generate commit message and prefill Git commit" })
end

return M

