return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets', "fang2hou/blink-copilot" },
  version = 'v0.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        function()
          if vim.fn.pumvisible() == 1 then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-y>', true, false, true), 'n', false)
            return true
          else
            return false
          end
        end,
        'snippet_forward',
        'fallback',
      },
    },

    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false
        },
        cycle = { from_bottom = true, from_top = true }
      },
      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
        end,
        max_height = 20,
        scrollbar = true,
        border = 'rounded',
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        draw = {
          columns = {
            { "kind_icon",   "label", "label_description", gap = 1 },
            { "source_name", gap = 1, "kind" }
          },
          components = {
            source_name = {
              width = { min = 4, max = 10 },
              text = function(ctx) return '[' .. ctx.source_name .. ']' end,
              highlight = 'BlinkCmpSource'
            }
          }
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = 'rounded',
          max_width = 80,
          max_height = 20,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder'
        }
      },
      -- ghost_text = { enabled = true }
    },
    cmdline = {
      completion = {
        menu = {
          draw = {
            columns = { { 'kind_icon', gap = 1 }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
          },
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
      kind_icons = {
        -- different icons of the corresponding source
        Text = "󰉿", -- `buffer`
        Snippet = "󰞘", -- `snippets`
        File = "", -- `path`
        Folder = "󰉋",
        Method = "󰊕",
        Function = "󰡱",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰀫",
        Class = "󰜁",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Color = "󰏘",
        Reference = "",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
        Copilot = " ",
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      per_filetype = {
        lua = { 'lsp', 'path', 'snippets', 'buffer' },
        gitcommit = { 'buffer' }
      },
      providers = {
        lsp = {
          name = 'LSP',
          module = 'blink.cmp.sources.lsp',
          score_offset = 90
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 50,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
            show_hidden_files_by_default = false
          }
        },
        snippets = {
          name = 'Snippets',
          module = 'blink.cmp.sources.snippets',
          score_offset = 70,
          opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            global_snippets = { "all" },
            extended_filetypes = {},
            ignored_filetypes = {}
          }
        },
        buffer = {
          name = 'Buffer',
          module = 'blink.cmp.sources.buffer',
          score_offset = 30,
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(buf)
                return vim.api.nvim_buf_is_loaded(buf)
              end, vim.api.nvim_list_bufs())
            end
          }
        },
        copilot = {
          name = "Copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
          opts = {
            max_lines = 10000,
            max_completion_length = 100
          }
        }
      }
    },

    signature = {
      enabled = true,
      window = {
        border = 'rounded',
        winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder'
      }
    },
    fuzzy = {
      implementation = "prefer_rust",
      use_frecency = true,
      use_proximity = true,
      sorts = { 'score', 'sort_text' }
    }
  },
  opts_extend = { 'sources.completion.enabled_providers' },
}
