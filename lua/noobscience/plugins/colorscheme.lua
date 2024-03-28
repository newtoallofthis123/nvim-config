return {
    {
        "loctvl842/monokai-pro.nvim",
    },
    {
        'projekt0n/github-nvim-theme',
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
        priority = 1000,
        config = function()
            -- vim.opt.background = 'light'
            vim.cmd([[colorscheme tokyonight-night]])
        end
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
    { "rose-pine/neovim",       name = "rose-pine" },
    { 'frenzyexists/aquarium-vim',
    },
    {
        'ramojus/mellifluous.nvim',

    },
    {
        'HoNamDuong/hybrid.nvim',
    },
    { 'nanotech/jellybeans.vim' },
}
