return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          -- { 'mode', separator = { left = '' }, right_padding = 1,},
          { 'mode', right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'searchcount' },
        lualine_x = { 'hostname' },
        lualine_y = { 'filesize', 'filetype', 'progress' },
        lualine_z = {
          -- { 'location', separator = { right = '' }, left_padding = 1 },
          { 'location', left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
