vim.cmd.colorscheme('vesper')

vim.opt.termguicolors = true

-- Setup telescope
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--follow",
            "--hidden",
            "--no-heading",
            "--no-ignore",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },

        pickers = {
            find_files = {
                hidden = true
            }
        },
    }
}

require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}
vim.filetype.add({ extension = { mdx = 'mdx' } })
--[[ local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.mdx = "markdown" ]]

vim.treesitter.language.register('markdown', {
    'mdx'
})

vim.api.nvim_set_keymap(
    "n",
    "<space>ff",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

require("telescope").load_extension "file_browser"

require('gitsigns').setup()

require("bufferline").setup({
})

require("crates").setup {}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})

require('lualine').setup()

local ccc = require("ccc")
local mapping = ccc.mapping

ccc.setup({
    -- Your preferred settings
    -- Example: enable highlighter
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
})

vim.api.nvim_exec([[
    autocmd BufEnter * execute 'cd' expand('%:p:h')
]], false)
