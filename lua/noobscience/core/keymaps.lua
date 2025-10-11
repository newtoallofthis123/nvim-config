vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", function() vim.cmd("bd!") end, { desc = "Delete buffer" })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<C-Tab>', ':bnext<CR>', { noremap = true })

vim.keymap.set('n', '<leader>%', ':Telescope colorscheme<CR>')

vim.api.nvim_set_keymap('n', '<leader>n', ':e <Space>', { noremap = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]])
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
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
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

vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
vim.keymap.set('n', '<leader>gsta', '<cmd>Git stash<cr>', { desc = 'Git stash' })
vim.keymap.set('n', '<leader>gstp', '<cmd>Git stash pop<cr>', { desc = 'Git stash pop' })

vim.keymap.set('n', '<leader>w<Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>w<Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>w<Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>w<Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', 't<Right>', ':tabNext<CR>', { desc = 'Move to the next tab' })
vim.keymap.set('n', 't<Left>', ':tabprevious<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-t><C-t>', ':tabnew<CR>', { desc = 'Create a new tab' })

local new_t = function()
  vim.cmd('tabnew')
  vim.cmd('term')
end

vim.keymap.set('n', '<leader>tn', new_t, { desc = 'Open a new terminal tab' })

-- Navigate to specific tabs with Ctrl+number
vim.keymap.set('n', '<leader>t1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>t2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>t3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', 'leader>t4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', 'leader>t5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', 'leader>t6', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', 'leader>t7', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', 'leader>t8', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', 'leader>t9', '9gt', { desc = 'Go to tab 9' })

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>zz', { desc = 'Open the quick list buffer' })
vim.keymap.set('n', '<A-k>', '<cmd>cprev<CR>zz', { desc = 'Next item in quickfix list' })

vim.keymap.set('n', '<leader>Qn', '<cmd>cnext<CR>zz', { desc = 'Next Item in the quickfix list' })
vim.keymap.set('n', '<leader>Qp', '<cmd>cprev<CR>zz', { desc = 'Previous Item in the quickfix list' })
