return {
    {
        "loctvl842/monokai-pro.nvim",
        -- priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme monokai-pro]])
        -- end
    },
    {
        'projekt0n/github-nvim-theme',
    },
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_background         = 'hard'
            vim.g.gruvbox_material_better_performance = 1
        end
    },
    {
        "polirritmico/monokai-nightasty.nvim",
    },
    {
        "chiendo97/intellij.vim"
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "olimorris/onedarkpro.nvim",
    },
    {
        "folke/tokyonight.nvim",
        -- priority = 1000,
        -- config = function()
        --     -- vim.opt.background = 'light'
        --     require("tokyonight").setup({
        --         styles = {
        --             comments = { italic = true },
        --             keywords = { italic = true },
        --         },
        --     })
        --     vim.cmd([[colorscheme tokyonight-night]])
        -- end
    },
    {
        'Mofiqul/vscode.nvim',
        -- priority = 1000,
        -- config = function()
        --     -- vim.opt.background = 'light'
        --     vim.cmd([[colorscheme vscode]])
        -- end
    },
    {
        'datsfilipe/vesper.nvim',
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end
    },
    { 'frenzyexists/aquarium-vim',
    },
    {
        'ramojus/mellifluous.nvim',

    },
    {
        'HoNamDuong/hybrid.nvim',
    },
    {
        'pwntester/nautilus.nvim',
    },
    { 'nanotech/jellybeans.vim' },
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { 'olivercederborg/poimandres.nvim' }
}
