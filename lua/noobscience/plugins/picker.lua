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
      actions = {
        set_glob_pattern = function(picker)
          require('snacks').input({
            prompt = 'Glob pattern: ',
          }, function(pattern)
            if pattern and pattern ~= '' then
              picker.opts.args = picker.opts.args or {}
              table.insert(picker.opts.args, '--glob=' .. pattern)
              picker:find()
            end
          end)
        end,
        search_in_directory = {
          action = function(_, item)
            if not item then
              return
            end
            local dir = vim.fn.fnamemodify(item.file, ':p:h')
            require('snacks').picker.grep {
              cwd = dir,
              cmd = 'rg',
              args = {},
              show_empty = true,
              hidden = true,
              ignored = true,
              follow = false,
              supports_live = true,
            }
          end,
        },
        search_files_in_directory = {
          action = function(_, item)
            if not item then
              return
            end
            local dir = vim.fn.fnamemodify(item.file, ':p:h')
            require('snacks').picker.files {
              cwd = dir,
              hidden = true,
              ignored = true,
              follow = false,
            }
          end,
        },
      },
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

      win = {
        input = {
          keys = {
            ['<S-k>'] = { 'history_back', mode = { 'n' } },
            ['<S-j>'] = { 'history_forward', mode = { 'n' } },
            ['t'] = { 'tab' },
            ['f'] = {
              'set_glob_pattern',
              mode = { 'n' },
              desc = 'Set glob pattern',
            },
            ['v'] = { 'edit_vsplit' },
          }
        }
      },

      list = {
        keys = {
          ['t'] = { 'tab' },
          ['v'] = { 'edit_vsplit' },
          ['f'] = {
            'set_glob_pattern',
            mode = { 'n' },
            desc = 'Set glob pattern',
          },
          ['s'] = { 'search_in_directory', desc = 'Search in directory' },
          ['S'] = { 'search_files_in_directory', desc = 'Search files in directory' },
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
          follow_file = false,
          auto_close = true,
          jump = { close = true },
          layout = {
            layout = {
              backdrop = false,
              width = 0.5,
              min_width = 80,
              height = 0.8,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input",   height = 1,          border = "bottom" },
              { win = "list",    border = "none" },
              { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
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

    { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
    { "<leader>fl", function() Snacks.picker.smart() end,                 desc = "Smart Search" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "<leader>D",  function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
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
