-- Custom grammar parser for grep
local function parse_grep_grammar(input)
  local opts = {}
  local search_pattern = input

  -- Parse directives: exclude:, glob:, ft:, dir:, hidden:, ignored:
  local directives = {
    exclude = {},
    glob = {},
    dirs = {},
  }

  -- Extract exclude: patterns
  search_pattern = search_pattern:gsub("exclude:([^%s]+)%s*", function(pattern)
    table.insert(directives.exclude, pattern)
    return ""
  end)

  -- Extract glob: patterns
  search_pattern = search_pattern:gsub("glob:([^%s]+)%s*", function(pattern)
    table.insert(directives.glob, pattern)
    return ""
  end)

  -- Extract ft: (file type)
  search_pattern = search_pattern:gsub("ft:([^%s]+)%s*", function(ft)
    opts.ft = ft
    return ""
  end)

  -- Extract dir: (directory)
  search_pattern = search_pattern:gsub("dir:([^%s]+)%s*", function(dir)
    table.insert(directives.dirs, dir)
    return ""
  end)

  -- Extract hidden: flag
  search_pattern = search_pattern:gsub("hidden:(%w+)%s*", function(value)
    opts.hidden = (value == "true" or value == "1")
    return ""
  end)

  -- Extract ignored: flag
  search_pattern = search_pattern:gsub("ignored:(%w+)%s*", function(value)
    opts.ignored = (value == "true" or value == "1")
    return ""
  end)

  -- Set arrays if they have values
  if #directives.exclude > 0 then
    opts.exclude = directives.exclude
  end
  if #directives.glob > 0 then
    opts.glob = directives.glob
  end
  if #directives.dirs > 0 then
    opts.dirs = directives.dirs
  end

  -- Clean up extra whitespace
  search_pattern = search_pattern:match("^%s*(.-)%s*$") or ""

  return search_pattern, opts
end

-- Custom smart grep function
local function smart_grep()
  require("snacks").input({
    prompt = "Smart Grep> ",
    icon = "🔍",
    icon_pos = "left",
  }, function(search_input)
    if not search_input or search_input == "" then
      return
    end

    local pattern, opts = parse_grep_grammar(search_input)
    opts.search = pattern

    require("snacks").picker.grep(opts)
  end)
end

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
        explorer = {
          layout = {
            layout = {
              position = "right",
            },
          },
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
    {
      "<leader>fS",
      smart_grep,
      desc = "Smart grep with custom grammar",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find string in cwd (standard)",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find word under cursor in cwd",
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

    { "<leader>fg", function() Snacks.picker.git_files() end,                                                    desc = "Find Git Files" },
    { "<leader>fl", function() Snacks.picker.smart() end,                                                        desc = "Smart Search" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,                                              desc = "Goto Definition" },
    { "<leader>D",  function() Snacks.picker.diagnostics_buffer() end,                                           desc = "Buffer Diagnostics" },
    { "<leader>W",  function() Snacks.picker.diagnostics() end,                                                  desc = "Workspace Diagnostics" },
    { "<leader>gI", function() Snacks.picker.lsp_implementations() end,                                          desc = "Goto Implementation" },
    { "<leader>gy", function() Snacks.picker.lsp_type_definitions() end,                                         desc = "Goto T[y]pe Definition" },
    { "<leader>o",  function() Snacks.picker.lsp_symbols() end,                                                  desc = "LSP Symbols" },
    { "<leader>O",  function() Snacks.picker.lsp_workspace_symbols() end,                                        desc = "LSP Workspace Symbols" },

    -- Explorer
    { "<leader>E",  function() Snacks.picker.explorer({ layout = { preset = "sidebar", preview = false } }) end, desc = "Picker Explorer" },
  },

  config = function()
    -- Any additional configuration can go here
  end,
}
