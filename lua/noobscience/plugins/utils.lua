return {
  name = "utils",
  dir = vim.fn.stdpath("config") .. "/lua/noobscience/custom/utils",
  dependencies = {
    "carbon-steel/detour.nvim",
  },
  config = function()
    local agent_utils = require("noobscience.custom.utils.utils")

    -- Cursor-agent detour functionality
    vim.keymap.set('n', '<leader>A', agent_utils.open_cursor_agent_detour, { desc = 'Open cursor-agent in detour window' })
    vim.keymap.set('n', '<leader>Ab', agent_utils.open_cursor_agent_detour_with_buffer, { desc = 'Open cursor-agent with buffer path' })
    vim.keymap.set('n', '<leader>Ap', agent_utils.open_cursor_agent_detour_with_path_and_line, { desc = 'Open cursor-agent with buffer path and line number' })
    vim.keymap.set('n', '<leader>At', agent_utils.open_cursor_agent_tab, { desc = 'Open cursor-agent in new tab' })

    -- Buffer utility functions
    vim.keymap.set('n', '<leader>bc', agent_utils.copy_buffer_path, { desc = 'Copy buffer path to clipboard (@filename)' })
    vim.keymap.set('n', '<leader>bn', agent_utils.copy_buffer_path_with_line, { desc = 'Copy buffer path with line number (@filename#123)' })
  end,
}
