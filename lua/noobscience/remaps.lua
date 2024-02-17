vim.g.mapleader = " "

-- LSP related Key bindings
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {
})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gh', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({
        search = vim.fn.input("Grep String > ")
    })
end, {})

vim.keymap.set('n', '<leader>t', function() vim.cmd('NvimTreeToggle') end)

vim.keymap.set('n', '<leader>C', function() vim.cmd('CccPick') end)

-- Harpoon settings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", function() mark.add_file() end)
vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end)

vim.keymap.set("n", "<leader>hm", function() mark.go_to_mark(1) end)

-- Vim Fugitive
vim.keymap.set("n", "<leader>gg", function() vim.cmd('Git') end)
vim.keymap.set("n", "<leader>gd", function() vim.cmd('Gdiffsplit') end)
vim.keymap.set("n", "<leader>gp", function() vim.cmd('Git push') end)
vim.keymap.set("n", "<leader>gb", function() vim.cmd('Git blame') end)
vim.keymap.set("n", "<leader>ga", function() vim.cmd('Git add .') end)

-- Todo Comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })

-- Undotree
vim.keymap.set('n', '<leader>y', vim.cmd.UndotreeToggle)

-- general settings
vim.keymap.set("n", "<leader>d", function() vim.cmd('bd') end)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "<leader>e", function() vim.cmd(':Ex') end)
vim.keymap.set("n", "<leader>l", function() vim.cmd('terminal fish') end)

vim.keymap.set("t", "<C-t>", function() vim.cmd('bd!') end)
