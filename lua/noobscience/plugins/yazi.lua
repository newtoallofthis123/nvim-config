return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>_",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
  },
}
