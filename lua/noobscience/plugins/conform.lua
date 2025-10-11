return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        php = { "pretty-php" },
        lua = { "stylua" },
        python = { "black" },
        cpp = { "clang-format" },
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        astro = { { "astro", "prettier" } },
        json = { { "prettierd", "prettier" } },
        blade = { "blade-formatter" }
      },
    })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
