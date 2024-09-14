return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                php = { "pretty-php" },
                lua = { "stylua" },
                python = { "black" },
                javascript = { { "prettierd", "prettier" } },
                html = { { "prettierd", "prettier" } },
                css = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                astro = { { "astro", "prettier" } },
                json = { { "prettierd", "prettier" } },
                blade = { "blade-formatter" }
            },
            -- format_on_save = {
            --   timeout_ms = 500,
            --   lsp_format = "fallback"
            -- },
        })
    end
}
