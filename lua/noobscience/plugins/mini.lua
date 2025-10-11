return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- require('mini.statusline').setup();
    -- require('mini.animate').setup();
    require("mini.ai").setup()
    require("mini.surround").setup()
  end
}
