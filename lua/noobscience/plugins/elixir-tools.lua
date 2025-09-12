return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = { enable = false },
      elixirls = {
        enable = true,

        repo = "elixir-lsp/elixir-ls",   -- defaults to elixir-lsp/elixir-ls
        branch = "master",               -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option


        settings = elixirls.settings {
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>co", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
