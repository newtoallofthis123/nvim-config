return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()

    vim.keymap.set("n", "<leader>w=", "<cmd>WindowsEqualize<cr>", { desc = "Equalize the window" })
    vim.keymap.set("n", "<leader>w+", "<cmd>WindowsMaximize<cr>", { desc = "Maximize the window" })
    vim.keymap.set("n", "<leader>w<", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize the window vertically" })
    vim.keymap.set("n", "<leader>w>", "<cmd>WindowsMaximizeHorizontally<cr>",
      { desc = "Maximize the window horizontally" })
  end
}
