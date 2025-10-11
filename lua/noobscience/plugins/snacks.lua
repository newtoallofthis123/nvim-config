return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
  opts = {
    scratch = {
      name = "Bin",
      ft = "markdown",
    },
    bigfile = {
      notify = true,
    },
    dashboard =
    {
      enabled = true,
      width = 60,
      row = nil,
      col = nil,
      pane_gap = 4,
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
      preset = {
        pick = nil,
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          {
            icon = " ",
            key = "n",
            desc = "New File",
            action = function()
              vim.cmd("bd!")
              vim.cmd("enew")
            end
          },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[


    _   __            __   _
   / | / /___  ____  / /_ ( )_____
  /  |/ / __ \/ __ \/ __ \|// ___/
 / /|  / /_/ / /_/ / /_/ / (__  )
/_/ |_/\____/\____/_.___/ /____/

        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          pane = 2,
          cmd = "git --no-pager diff --stat -B -M -C",
          height = 10,
        },
      },
    },
    gitbrowse = {},
    -- indent = {},
    -- scroll = {},
    image = {},
    indent = {
      enabled = false,
      char = "i",
      only_scope = true,
      only_current = true,
      chunk = {
        enabled = true,
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk",
        char = {
          corner_top = "┌",
          corner_bottom = "└",
          horizontal = "─",
          vertical = "│",
          arrow = ">",
        },
      },
    },
    explorer = {},
    lazygit = {},
    quickfile = {
      enabled = false,
    },
    terminal = {
      win = {
        style = "terminal",
      },
    },
    statuscolumn = {},
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
        Snacks.terminal.toggle("zsh", {
          win = {
            position = "bottom",
            height = 0.3,
          }
        })
      end,
      desc = "Toggle Horizontal Terminal",
    },
    {
      "<C-w>/",
      function()
        Snacks.terminal.toggle("zsh", {
          win = {
            position = "float",
          },
          auto_insert = true
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    {
      "<leader>gw",
      function()
        Snacks.gitbrowse.open()
      end,
    }
  },
}
