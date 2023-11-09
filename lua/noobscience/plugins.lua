vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- The default packer plugin
    use 'wbthomason/packer.nvim'

    -- For the cool icons
    use 'nvim-tree/nvim-web-devicons'
    -- Nvim treesitter for better highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- The telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- LSP zero for the LSP config
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- For Progress
    use({
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup()
        end
    })

    -- Rust specific
    use {
        'saecki/crates.nvim', tag = 'v0.4.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            require 'crates'.setup {}
        end
    }
    use 'simrat39/rust-tools.nvim'

    -- Go related
    use 'ray-x/go.nvim'

    -- The cool lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Fav themes
    use({ 'projekt0n/github-nvim-theme' })
    use 'tanvirtin/monokai.nvim'
    use "olimorris/onedarkpro.nvim"

    -- Auto brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- The bufferline
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Cool gitsigns
    use 'lewis6991/gitsigns.nvim'

    -- For the vscode like bread crumbs
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons",       -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup({
                show_basename = false,
                show_dirname = false,
            })
        end,
    })

    use({
        "ms-jpq/chadtree",
        branch = "chad",
    })

    use 'adelarsq/vim-devicons-emoji'

    use({
        'uga-rosa/ccc.nvim',
    })

    use {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup(require("noobscience.dashboard"))
        end
    }

    use 'wakatime/vim-wakatime'
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'windwp/nvim-ts-autotag'

    use 'ThePrimeagen/harpoon'

    use 'tpope/vim-fugitive'

    use 'mbbill/undotree'
end)
