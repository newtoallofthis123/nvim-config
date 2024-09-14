return {
  "leath-dub/snipe.nvim",
  config = function()
    local snipe = require("snipe")
    snipe.setup()
    vim.keymap.set("n", "<leader>bb", snipe.create_buffer_menu_toggler())
  end
}
