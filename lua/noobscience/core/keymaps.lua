vim.g.mapleader = " "

-- local keymap = vim.keymap

vim.keymap.set("n", "<leader>d", vim.cmd.bd, { desc = "Delete buffer" })
-- vim.keymap.set("n", "<leader>d", function()
-- 	if vim.fn.winnr('$') > 1 then
-- 		vim.cmd('close')
-- 	else
-- 		vim.cmd('bd!')
-- 	end
-- end, { desc = "Close split or delete buffer if last window" })
vim.keymap.set("n", "<leader>q", function() vim.cmd('close') end)
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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n", "v"}, "<leader>x", [["_d]])
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
-- vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>gs', ':Git status<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gsc', function()
    local branch_name = vim.fn.input('Branch name: ')
    if branch_name ~= '' then
        vim.cmd('Git switch -c ' .. branch_name)
    end
end, { desc = 'Create and switch to new branch' })
-- TODO: Fix
vim.keymap.set('n', '<leader>gpr', function()
    local reviewers = vim.fn.input('Reviewers (comma-separated): ')
    if reviewers ~= '' then
        local reviewer_args = ''
        for reviewer in reviewers:gmatch('([^,]+)') do
            reviewer = reviewer:match('^%s*(.-)%s*$') -- trim whitespace
            if reviewer ~= '' then
                reviewer_args = reviewer_args .. ' --reviewer ' .. reviewer
            end
        end
        vim.cmd('!gh pr create' .. reviewer_args .. ' --fill-first --head')
    end
end, { desc = 'Create PR with reviewers' })

-- Some formatting keymaps
vim.api.nvim_set_keymap('n', '<leader>fpy', ':!black %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fph', ':!pretty-php %<CR>', { noremap = true })

-- Some Buffers and stuff
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':set spell spelllang=en<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gS', ':set nospell<CR>', { noremap = true })

vim.keymap.set('n', '<leader>w<Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>w<Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>w<Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>w<Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- vim.keymap.set('n', '<leader>vs', '<C-w>v', { desc = 'Split window vertically' })
-- vim.keymap.set('n', '<leader>hs', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-t><Right>', ':tabNext<CR>', { desc = 'Move to the next tab' })
vim.keymap.set('n', '<C-t><Left>', ':tabprevious<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-t>l', ':tabNext<CR>', { desc = 'Move to the next tab' })
vim.keymap.set('n', '<C-t>h', ':tabprevious<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-t><C-t>', ':tabnew<CR>', { desc = 'Create a new tab' })

local new_t = function()
    vim.cmd('tabnew')
    vim.cmd('term')
end

local h_t = function ()
    vim.cmd('split')
    vim.cmd('wincmd r')
    vim.cmd('wincmd h')
    vim.cmd('wincmd 6-')
    vim.cmd('term')
end

vim.keymap.set('n', '<C-t>t', new_t, { desc = 'Open a new terminal tab' })
vim.keymap.set('n', '<C-t>h', h_t, { desc = 'Open a terminal in a horizontal split' })

vim.keymap.set('n', '<leader>st', ':term<CR>', { desc = 'Open a terminal' })

vim.keymap.set('n', '<leader>go', ':!qit o<CR>', { desc = 'Open Git Repo in the browser' })

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>zz', { desc = 'Open the quick list buffer' })
vim.keymap.set('n', '<A-k>', '<cmd>cprev<CR>zz', { desc = 'Next item in quickfix list' })

vim.keymap.set('n', '<leader>rf', ':!zellij run -f', { desc = 'Run in Zellij Floating window' })
vim.keymap.set('n', '<leader>t', ':Ex<CR>', { desc = 'Open Netrw' })
vim.keymap.set('n', '<leader>cce', ':Copilot enable<CR>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>ccw', ':Copilot disable<CR>', { desc = 'Disable Copilot' })
