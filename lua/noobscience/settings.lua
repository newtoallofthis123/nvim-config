vim.cmd('colorscheme monokai_ristretto')

vim.opt.termguicolors = true

-- Setup telescope
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--follow",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },

        pickers = {
            find_files = {
                hidden = true
            }
        }
    }
}

require('gitsigns').setup()

require("bufferline").setup({})

require("crates").setup {}

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})

require('lualine').setup()

require('lualine').setup({
    options = {
        theme = 'github_dark'
    },
})

local chadtree_settings = {
    theme = {
        icon_glyph_set = 'emoji'
    }
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

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

