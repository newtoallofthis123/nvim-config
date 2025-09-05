return { {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', "fang2hou/blink-copilot"},
    version = 'v0.*',
    opts = {
        keymap = { preset = 'default' },

        completion = {
            -- list = { selection = { preselect = function(ctx) return ctx.mode ~= 'cmdline' end }}
            list = { selection = { preselect = true, auto_insert = false } },
            menu = {
                auto_show = function(ctx)
                    return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                end,
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
            default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer'},
            providers = {
                snippets = {
                    opts = {
                        search_paths = { vim.fn.stdpath("config") .. "/snippets", }
                    }
                },
              copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
            },
            },
        },

        signature = { enabled = true },
        fuzzy = {
            implementation = "prefer_rust"
        }
    },
    opts_extend = { "sources.default" }
},
}
