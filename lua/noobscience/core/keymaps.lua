vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>d", function() vim.cmd('bd') end)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

keymap.set("n", "<leader>l", function() vim.cmd('terminal fish') end)

keymap.set("t", "<C-t>", function() vim.cmd('bd!') end)

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Make new file
vim.api.nvim_set_keymap('n', '<leader>n', ':e <Space>', { noremap = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set('n', '<leader>q', vim.cmd.Q)

vim.keymap.set('n', '<C-S>', vim.cmd.w)

vim.keymap.set('n', '<C-Q>', vim.cmd.qa)

vim.keymap.set('n', '<leader>li', function() vim.cmd('colorscheme github_light') end)
vim.keymap.set('n', '<leader>da', function() vim.cmd('colorscheme monokai-pro') end)

vim.o.completeopt = "menuone,noinsert,noselect"
