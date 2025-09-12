return {
  "SunnyTamang/pendulum.nvim",
  config = function()
    require "pendulum".setup({
      lualine = true,       --Enables displaying the timer in Lualine (if lualine installed)
    })
  end,
  enabled = false
}
