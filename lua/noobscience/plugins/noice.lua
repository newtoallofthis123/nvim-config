return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    keys = {
        { "<Esc>", vim.cmd.NoiceDismiss, desc = "󰎟 Clear notifications" },
    }
    ,
    config = function()
        require("noice").setup({
            routes = {
                { filter = { event = "msg_show", find = "%d+B written$" },              view = "mini" },
                { filter = { event = "msg_show", find = "%d+L, %d+B$" },                view = "mini" },
                { filter = { event = "msg_show", find = "%-%-No lines in buffer%-%-" }, view = "mini" },

                { filter = { event = "msg_show", find = "^E486: Pattern not found" },   view = "mini" },
                { filter = { event = "msg_show", find = "^[/?]." },                     skip = true },

                { filter = { event = "msg_show", find = "Treesitter.*- @" },            view = "popup" },

                { filter = { event = "notify", find = "^Client marksman quit with" },   skip = true },

                { filter = { event = "notify", find = "No code actions available" },    skip = true },
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                signature = { enabled = false },
                hover = { enabled = false },
            },
            messages = {
                view = "notify",           -- default view for messages
                view_error = "notify",     -- view for errors
                view_warn = "notify",      -- view for warnings
                view_history = "messages", -- view for :messages
            },
            presets = {
                lsp_doc_border = true
            },
            views = {
                cmdline_popup = {
                    border = { style = vim.g.borderStyle },
                },
            }
        })
        require("notify").setup({
            background_colour = "#000000",
        })
    end,
    enabled = false,
}
