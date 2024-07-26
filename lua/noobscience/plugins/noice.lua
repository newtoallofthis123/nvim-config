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
    config = function()
        require("noice").setup({
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
        })
        require("notify").setup({
            background_colour = "#000000",
        })
    end,
    enabled = false,
}
