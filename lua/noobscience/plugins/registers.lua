return {
  "tversteeg/registers.nvim",
  cmd = "Registers",
  config = function()
    return require("registers").setup({})
  end,
  keys = {
    { "\"",    mode = { "n", "v" } },
    { "<C-R>", mode = "i" }
  },
}
