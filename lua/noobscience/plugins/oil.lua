return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
