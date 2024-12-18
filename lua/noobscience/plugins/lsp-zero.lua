return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        'onsails/lspkind.nvim'
    },
    -- Autocompletion
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     dependencies = {
    --         { 'L3MON4D3/LuaSnip' },
    --     },
    --     config = function()
    --         -- Here is where you configure the autocompletion settings.
    --         local lsp_zero = require('lsp-zero')
    --         lsp_zero.extend_cmp()
    --         local cmp_mappings = lsp_zero.defaults.cmp_mappings()
    --         cmp_mappings['<Tab>'] = nil
    --         cmp_mappings['<S-Tab>'] = nil
    --         -- And you can configure cmp even more, if you want to.
    --         local cmp = require('cmp')
    --         local cmp_action = lsp_zero.cmp_action()
    --         local lspkind = require('lspkind')
    --         cmp.setup({
    --             formatting = {
    --                 format = lspkind.cmp_format({
    --                     mode = 'symbol',
    --                     maxwidth = 50,
    --                     ellipsis_char = '...',
    --                 })
    --
    --             },
    --             sources = {
    --                 { name = "nvim_lsp" },
    --                 { name = "path" },
    --                 { name = "buffer" },
    --             },
    --             window = {
    --                 border = "rounded",
    --             },
    --             completion = {
    --                 border = "rounded",
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-k>"] = cmp.mapping.select_prev_item(),
    --                 ["<C-j>"] = cmp.mapping.select_next_item(),
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-d>'] = cmp.mapping.scroll_docs(4),
    --                 ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --                 ['<CR>'] = cmp.mapping.confirm({ select = false }),
    --                 ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    --             }),
    --         })
    --     end
    -- },
    {
        "ray-x/go.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()'
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            inlay_hints = { enabled = true },
        },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'saghen/blink.cmp' }
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            local capabilities = require('blink.cmp').get_lsp_capabilities()


            vim.filetype.add({ extension = { mdx = 'mdx' } })
            vim.treesitter.language.register('markdown', {
                'mdx'
            })

            vim.filetype.add({ extension = { templ = "templ" } })
            local lsp_config = require('lspconfig')

            -- Ocamll LSP
            lsp_config.ocamllsp.setup({
                cmd = { "ocamllsp" },
                filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
                root_dir = lsp_config.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project",
                    "dune-workspace"),
            })

            -- C++ LSP
            lsp_config.clangd.setup {
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false
                    on_attach(client, bufnr)
                end,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "--background-index",
                    "--clang-flag=-std=c++20"
                },
            }

            -- Zig Lsp
            lsp_config.zls.setup({
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        inlay_hints_show_builtin = true,
                        inlay_hints_exclude_single_argument = true,
                        inlay_hints_hide_redundant_param_names = false,
                        inlay_hints_hide_redundant_param_names_last_token = false,
                    },
                }
            })

            -- Tailwind LSP
            lsp_config.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "templ", "astro", "javascript", "typescript", "react" },
                init_options = { userLanguages = { templ = "html" } },
            })

            -- Pyright Lsp
            lsp_config.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                        }
                    }
                }
            })

            lsp_config.emmet_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "xml", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "templ", "blade" },
            })

            local function on_attach(client, bufnr)
                vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

                vim.api.nvim_create_autocmd("InsertEnter", {
                    buffer = bufnr,
                    callback = function() vim.lsp.inlay_hint.enable() end,
                    group = "lsp_augroup",
                })
                vim.api.nvim_create_autocmd("InsertLeave", {
                    buffer = bufnr,
                    callback = function() vim.lsp.inlay_hint.enable() end,
                    group = "lsp_augroup",
                })
            end

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                local keymap = vim.keymap

                local opts = { noremap = true, silent = true }
                opts.buffer = bufnr

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "<leader>A", "<cmd>Telescope diagnostics<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end)

            lsp_zero.set_sign_icons({
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        capabilities =
                            capabilities
                    })
                end,

                ["gopls"] = function()
                    require("go").setup()
                end
            })
            local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimports()
                end,
                group = format_sync_grp,
            })
        end
    }
}
