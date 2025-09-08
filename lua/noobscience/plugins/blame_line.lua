return {
  'braxtons12/blame_line.nvim',
  config = function()
    require("blame_line").setup {
      show_in_insert = false,
      template = "<author> • <author-time> • <summary>"
    }
  end,
  enabled = false
}
