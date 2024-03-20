vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>d", function() vim.cmd('bd') end)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

keymap.set("n", "<leader>l", function() vim.cmd('terminal fish') end)

keymap.set("t", "<C-t>", function() vim.cmd('bd!') end)

vim.api.nvim_set_keymap('n', '<C-Tab>', ':bnext<CR>', { noremap = true })

vim.keymap.set('n', '<leader>%', ':Telescope colorscheme<CR>')

-- Make new file
vim.api.nvim_set_keymap('n', '<leader>n', ':e <Space>', { noremap = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set('n', '<C-S>', vim.cmd.w)

vim.keymap.set('n', '<C-Q>', vim.cmd.qa)

-- Quickly Change Colorschemes
vim.keymap.set('n', '<leader>li', function() vim.cmd('colorscheme rose-pine-dawn') end)
vim.keymap.set('n', '<leader>lv', function() vim.opt.background = 'light' end)
vim.keymap.set('n', '<leader>dv', function() vim.opt.background = 'dark' end)
vim.keymap.set('n', '<leader>da', function() vim.cmd('colorscheme vscode') end)

vim.o.completeopt = "menuone,noinsert,noselect"

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gm', ':Git push origin main<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git status<CR>', { noremap = true })
