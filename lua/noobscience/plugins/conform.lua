return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { { "prettierd", "prettier" } },
                html = { { "prettierd", "prettier" } },
                css = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                astro = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                php = { { "pretty-php" } },
            },
        })
    end
}
