return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- actions = require("trouble.sources.snacks").actions,
      layout = {
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.45,
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "left",
          { win = "input", height = 1, border = "bottom" },
          {
            box = "horizontal",
            { win = "list",    border = "none" },
            { win = "preview", title = "{preview}", width = 0.6, border = "left" },
          },
        },
      },

      matcher = {
        frecency = true,
      },
      -- win = {
      --   input = {
      --     keys = {
      --       ["<c-t>"] = {
      --         "trouble_open",
      --         mode = { "n", "i" },
      --       },
      --     },
      --   },
      -- },

      keys = {
        i = {
          ["<C-k>"] = "move_up",
          ["<C-j>"] = "move_down",
          ["<C-l>"] = "select_and_accept",
        },
      },

      sources = {
        files = {
          hidden = true,
          follow = true,
        },
        grep = {
        },
      },
    },
  },

  keys = {
    -- File operations
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Fuzzy find files in cwd",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.recent()
      end,
      desc = "Fuzzy find recent files",
    },
    {
      "<leader>e",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find open buffers",
    },

    -- Search operations
    {
      "<leader>fs",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find string in cwd",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find string under cursor in cwd",
    },

    -- LSP operations
    {
      "<leader>fo",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "Work space symbols",
    },

    -- System operations
    {
      "<leader>fr",
      function()
        Snacks.picker.registers()
      end,
      desc = "Select from register",
    },

    -- Lsp

    { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
    { "<leader>fl", function() Snacks.picker.smart() end,                 desc = "Smart Search" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
    { "<leader>W",  function() Snacks.picker.diagnostics() end,           desc = "Workspace Diagnostics" },
    { "<leader>gI", function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "<leader>gy", function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
    { "<leader>o",  function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>O",  function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Explorer
    { "<leader>E",  function() Snacks.picker.explorer() end,              desc = "Picker Explorer" },
  },

  config = function()
    -- Any additional configuration can go here
  end,
}
