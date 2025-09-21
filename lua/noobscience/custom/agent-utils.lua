local M = {}

-- Helper function to get relative filepath from pwd and format as @path
local function get_relative_filepath()
  local filepath = vim.fn.expand('%:p')
  local cwd = vim.fn.getcwd()

  -- Remove the cwd from the filepath to get relative path
  local relative_path = filepath:gsub(vim.pesc(cwd .. '/'), '')

  if relative_path == "" or relative_path == filepath then
    return "@[No Name]"
  end

  return "@" .. relative_path
end

-- Helper function to get current line number
local function get_current_line()
  return vim.fn.line('.')
end

-- Helper function to format buffer path with line number as @path#123
local function get_relative_filepath_with_line()
  local relative_path = get_relative_filepath()
  local line_num = get_current_line()

  if relative_path == "@[No Name]" then
    return "@[No Name]#" .. line_num
  end

  return relative_path .. "#" .. line_num
end

-- Copy current buffer path to clipboard (@path format)
function M.copy_buffer_path()
  local formatted_path = get_relative_filepath()
  vim.fn.setreg('+', formatted_path)
  vim.notify("Copied to clipboard: " .. formatted_path)
end

-- Copy current buffer path with line number to clipboard (@path#123 format)
function M.copy_buffer_path_with_line()
  local formatted_path = get_relative_filepath_with_line()
  vim.fn.setreg('+', formatted_path)
  vim.notify("Copied to clipboard: " .. formatted_path)
end

-- Open cursor-agent in detour window
function M.open_cursor_agent_detour()
  local window_id = require("detour").Detour()
  if not window_id then
    return
  end

  vim.cmd.terminal("cursor-agent")
  vim.bo.bufhidden = "delete"
  vim.wo[window_id].signcolumn = "no"

  -- Map escape key back to itself for terminal interaction
  vim.keymap.set("t", "<Esc><Esc>", "<Esc>", { buffer = true })

  vim.cmd.startinsert()

  -- Handle terminal close
  vim.api.nvim_create_autocmd({ "TermClose" }, {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.api.nvim_feedkeys("i", "n", false)
    end,
  })
end

-- Open cursor-agent in detour window with buffer file path prefilled
function M.open_cursor_agent_detour_with_buffer()
  local window_id = require("detour").Detour()
  if not window_id then
    return
  end

  local buffer_path = get_relative_filepath()
  vim.cmd.terminal("cursor-agent")
  vim.bo.bufhidden = "delete"
  vim.wo[window_id].signcolumn = "no"

  -- Send the buffer path to the terminal
  vim.api.nvim_chan_send(vim.bo.channel, buffer_path)

  -- Map escape key back to itself for terminal interaction
  vim.keymap.set("t", "<Esc><Esc>", "<Esc>", { buffer = true })

  -- Handle terminal close
  vim.api.nvim_create_autocmd({ "TermClose" }, {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.api.nvim_feedkeys("i", "n", false)
    end,
  })
end

-- Open cursor-agent in detour window with buffer file path and line number prefilled
function M.open_cursor_agent_detour_with_path_and_line()
  local window_id = require("detour").Detour()
  if not window_id then
    return
  end

  local buffer_path_with_line = get_relative_filepath_with_line()
  vim.cmd.terminal("cursor-agent")
  vim.bo.bufhidden = "delete"
  vim.wo[window_id].signcolumn = "no"

  -- Send the buffer path with line number to the terminal
  vim.api.nvim_chan_send(vim.bo.channel, buffer_path_with_line)

  -- Map escape key back to itself for terminal interaction
  vim.keymap.set("t", "<Esc><Esc>", "<Esc>", { buffer = true })

  -- Handle terminal close
  vim.api.nvim_create_autocmd({ "TermClose" }, {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.api.nvim_feedkeys("i", "n", false)
    end,
  })
end

-- Open cursor-agent in a new tab
function M.open_cursor_agent_tab()
  vim.cmd.tabnew()
  vim.cmd.terminal("cursor-agent")
  vim.bo.bufhidden = "delete"

  -- Map escape key back to itself for terminal interaction
  vim.keymap.set("t", "<Esc><Esc>", "<Esc>", { buffer = true })

  vim.cmd.startinsert()

  -- Handle terminal close
  vim.api.nvim_create_autocmd({ "TermClose" }, {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.api.nvim_feedkeys("i", "n", false)
    end,
  })
end

return M