return {
  "folke/snacks.nvim",
  opts = {
    init = {
      -- your init configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    scratch = {
      name = "Bin",
      ft = "markdown",
    },
    bigfile = {
      notify = true,
    },
    gitbrowse = {},
    indent = {},
    scroll = {},
    image = {},
    explorer = {},
    lazygit = {},
    image = {},
    quickfile = {
      enabled = false,
    },
    terminal = {},
  },
  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line({})
      end,
    },
    {
      "<leader>I",
      function()
        Snacks.indent.enable()
      end,
    },
    {
      "<leader>gI",
      function()
        Snacks.indent.disable()
      end,
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.open({})
      end,
    },
    {
      "<C-w>t",
      function()
        Snacks.terminal.toggle("zsh")
      end,
    },
    {
      "<leader>gw",
      function()
        Snacks.gitbrowse.open()
      end,
    }
  },
  config = function() end,
}
