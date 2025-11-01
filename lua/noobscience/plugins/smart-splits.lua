return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    require("smart-splits").setup({
      ignored_filetypes = {
        "NvimTree",
        "neo-tree",
        "snacks_picker",
        "snacks_picker_list",
        "snacks_picker_input",
        "snacks_picker_preview",
      },
      ignored_buftypes = { "nofile", "prompt", "popup" },
      default_amount = 3,
      cursor_follows_swapped_bufs = false,
      ignored_events = {
        "BufEnter",
        "WinEnter",
      },
      log_level = "info",
    })

    local splits = require("smart-splits")

    vim.keymap.set('n', '<C-h>', splits.move_cursor_left)
    vim.keymap.set('n', '<C-j>', splits.move_cursor_down)
    vim.keymap.set('n', '<C-k>', splits.move_cursor_up)
    vim.keymap.set('n', '<C-l>', splits.move_cursor_right)
    vim.keymap.set('n', '<C-\\>', splits.move_cursor_previous)
  end,
  enabled = false
}
