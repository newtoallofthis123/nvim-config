return { {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'giuxtaposition/blink-cmp-copilot' },
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
            default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
            providers = {
                snippets = {
                    opts = {
                        search_paths = { vim.fn.stdpath("config") .. "/snippets", }
                    }
                },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },

        signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
},
}
