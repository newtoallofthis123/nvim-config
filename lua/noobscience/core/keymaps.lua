vim.g.mapleader = " "

-- local keymap = vim.keymap

vim.keymap.set("n", "<leader>d", function() vim.cmd('bd!') end)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<C-Tab>', ':bnext<CR>', { noremap = true })

vim.keymap.set('n', '<leader>%', ':Telescope colorscheme<CR>')

-- Make new file
vim.api.nvim_set_keymap('n', '<leader>n', ':e <Space>', { noremap = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Thank you ThePrimagen
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

vim.keymap.set('n', '<C-S>', vim.cmd.w)

vim.keymap.set('n', '<C-Q>', vim.cmd.qa)

-- Quickly Change Color schemes
vim.keymap.set('n', '<leader>li', function()
    vim.opt.background = 'light'
    vim.cmd('colorscheme PaperColor')
end)
vim.keymap.set('n', '<leader>lv', function() vim.opt.background = 'light' end)
vim.keymap.set('n', '<leader>dv', function() vim.opt.background = 'dark' end)
vim.keymap.set('n', '<leader>da', function() vim.cmd('colorscheme monokai-pro') end)

vim.o.completeopt = "menuone,noinsert,noselect"

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>gs', ':Git status<CR>', { noremap = true })

-- Some formatting keymaps
vim.api.nvim_set_keymap('n', '<leader>fpy', ':!black %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fph', ':!pretty-php %<CR>', { noremap = true })

-- Some Buffers and stuff
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':set spell spelllang=en<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gS', ':set nospell<CR>', { noremap = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>vs', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>hs', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-t><Right>', ':tabNext<CR>', { desc = 'Move to the next tab' })
vim.keymap.set('n', '<C-t><Left>', ':tabprevious<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-t>l', ':tabNext<CR>', { desc = 'Move to the next tab' })
vim.keymap.set('n', '<C-t>h', ':tabprevious<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-t><C-t>', ':tabnew<CR>', { desc = 'Create a new tab' })

vim.keymap.set('n', '<leader>go', ':!qit o<CR>', { desc = 'Open Git Repo in the browser' })

vim.keymap.set('n', '<leader>q', '<cmd>copen<CR>zz', { desc = 'Open the quick list buffer' })
vim.keymap.set('n', '<leader>;', '<cmd>cnext<CR>zz', { desc = 'Next item in quickfix list' })
vim.keymap.set('n', '<leader>h', '<cmd>lnext<CR>zz', { desc = 'Next item in location list' })


vim.keymap.set('n', '<leader>rf', ':!zellij run -f', { desc = 'Run in Zellij Floating window' })
