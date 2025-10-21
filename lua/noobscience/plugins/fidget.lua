return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      window = {
        winblend = 0, -- Transparency level (0 = opaque, 100 = fully transparent)
        normal_hl = "Normal", -- Use Normal highlight group for transparent background
      },
    },
    integration = {
      ["nvim-tree"] = {
        enable = true,
      },
    },
  },
  -- enabled = false
}
