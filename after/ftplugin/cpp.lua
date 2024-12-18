local opt = vim.opt_local
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

local term_run = function()
    vim.cmd('vnew')
    vim.cmd('term make run')
    vim.cmd('wincmd 15<')
end

vim.keymap.set('n', '<leader>rt', term_run, { desc = 'Run the program' })
