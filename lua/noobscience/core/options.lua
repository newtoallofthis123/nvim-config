vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

-- terminal options
vim.opt.shell = "/usr/bin/fish"
vim.opt.shellcmdflag = "-c"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- vim.opt.colorcolumn = "80"
-- vim.o.clipboard = "unnamedplus"

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set mouse=a")
-- vim.cmd("set guicursor=n-v-c-i:ver1")
vim.cmd("set termguicolors")
vim.cmd("set encoding=UTF-8")

vim.cmd("set wildmenu")
vim.cmd("set nocompatible")
vim.cmd("set path+=**")
vim.cmd("set wildmenu")
vim.cmd("set wildignore+=**/.git/**")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Autocmd to persist undo tree on Neovim exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("UndotreePersistUndo")
  end
})

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

-- vim.cmd([[colorscheme retrobox]])
