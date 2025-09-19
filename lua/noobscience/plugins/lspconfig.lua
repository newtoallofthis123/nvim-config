return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.general = capabilities.general or {}
    capabilities.general.positionEncodings = { 'utf-16' }

    local opts = { silent = true }

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- opts.desc = "Show LSP references"
    -- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    -- opts.desc = "Show LSP document symbols"
    -- vim.keymap.set("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", opts)
    -- opts.desc = "Show LSP definitions"
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- opts.desc = "Show LSP implementations"
    -- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    --
    -- opts.desc = "Show LSP type definitions"
    -- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    -- opts.desc = "Show buffer diagnostics"
    -- vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
    --
    -- opts.desc = "Show workspace diagnostics"
    -- vim.keymap.set("n", "<leader>A", "<cmd>Telescope diagnostics<CR>", opts)

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "Format buffer"
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }

    vim.lsp.config.pyright = {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
          },
        },
      },
    }

    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
      init_options = {
        preferences = {
          disableSuggestions = false,
        },
      },
    }

    vim.lsp.config.emmet_ls = {
      capabilities = capabilities,
    }

    vim.lsp.config.rust_analyzer = {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    }

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        }
      },
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })
  end,
}
