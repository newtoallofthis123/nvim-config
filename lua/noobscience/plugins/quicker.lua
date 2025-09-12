return {
  'stevearc/quicker.nvim',
  event = "FileType qf",
  opts = {},
  config = function()
    require("quicker").setup({
      opts = {
        buflisted = false,
        number = false,
        relativenumber = false,
        signcolumn = "auto",
        winfixheight = true,
        wrap = false,
      },
    })
    vim.keymap.set("n", "<leader>Q", function()
      require("quicker").toggle_expand()
    end, {
      desc = "Toggle quickfix expand",
    })
    vim.keymap.set("n", "<leader>l", function()
      require("quicker").toggle()
    end, {
      desc = "Toggle loclist",
    })
  end
}
