vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
vim.o.tabclose = 'uselast'
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.list = true
vim.opt.showbreak = '↪ '
vim.opt.foldnestmax = 20
vim.opt.foldminlines = 2
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.foldenable = true
vim.o.foldcolumn = '0'
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
    ['.*%.mdx'] = 'markdown',
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
