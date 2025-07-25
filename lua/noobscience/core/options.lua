vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

-- terminal options
vim.opt.shell = "/bin/zsh"
vim.opt.shellcmdflag = "-c"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- vim.opt.colorcolumn = "90"
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

vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    },
})

vim.cmd([[colorscheme retrobox]])

vim.api.nvim_create_user_command("E", function(opts)
    local path = vim.fn.expand(opts.args)
    local dir = vim.fn.fnamemodify(path, ":h")
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
    vim.cmd("edit " .. path)
end, { nargs = 1, complete = "file" })

-- For dark mode by default
vim.opt.background = 'dark'
