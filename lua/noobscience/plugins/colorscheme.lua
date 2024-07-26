return {
    {
        "loctvl842/monokai-pro.nvim",
        -- priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme monokai-pro-spectrum]])
        -- end
    },
    {
        'projekt0n/github-nvim-theme',
        -- priority = 1000,
        -- config = function()
        --   vim.cmd([[colorscheme github_light]])
        -- end
    },
    {
        'sainnhe/gruvbox-material',
        -- priority = 1000,
        -- config = function()
        --   vim.g.gruvbox_material_background         = 'hard'
        --   vim.g.gruvbox_material_better_performance = 1
        --   vim.cmd([[colorscheme gruvbox-material]])
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto",
                show_end_of_buffer = true,
                no_bold = true,
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
    {
        "folke/tokyonight.nvim",
        -- priority = 1000,
        -- config = function()
        --   -- vim.opt.background = 'light'
        --   require("tokyonight").setup({
        --     -- transparent = true,
        --     styles = {
        --       comments = { italic = true },
        --       keywords = { italic = true },
        --     },
        --   })
        --   vim.cmd([[colorscheme tokyonight-night]])
        -- end
    },
    {
        'Mofiqul/vscode.nvim',
        -- priority = 1000,
        -- config = function()
        --   -- vim.opt.background = 'light'
        --   vim.cmd([[colorscheme vscode]])
        -- end
    },
    {
        'datsfilipe/vesper.nvim',
        -- priority = 1000,
        -- config = function()
        --   vim.cmd([[colorscheme vesper]])
        -- end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- priority = 1000,
        -- config = function()
        --     require("rose-pine").setup({
        --         variant = "auto",
        --         dark_variant = "main",
        --         dim_inactive_windows = false,
        --         extend_background_behind_borders = true,
        --         styles = {
        --             bold = false,
        --             italic = false,
        --             transparency = false,
        --         }
        --     })
        --     vim.cmd([[colorscheme rose-pine]])
        -- end
    },
    {
        'NLKNguyen/papercolor-theme'
    },
    {
        "EdenEast/nightfox.nvim",
        -- priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme duskfox]])
        -- end
    },
}
