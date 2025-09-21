return {
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        filter = "spectrum",
        background_clear = {
          "telescope",
          "which-key",
          "nvim-tree",
          "bufferline",
          "float_win",
          "renamer",
          "toggleterm",
          "blink"
        },
        override = function()
          return {
            Pmenu = { bg = "NONE" },
            PmenuThumb = { bg = "NONE" },
            BlinkCmpMenu = { bg = "NONE" },
          }
        end
      })
      vim.cmd([[colorscheme monokai-pro-spectrum]])
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        bold = false,
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = false,
        },
        contrast = "hard",         -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
          WhichKey = { bg = "NONE" },
          WhichKeyNormal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          BlinkCmpMenu = { bg = "NONE" },
          Pmenu = { bg = "NONE" },
          PmenuThumb = { bg = "NONE" }
        },
        dim_inactive = false,
        transparent_mode = true,
      })
      -- vim.cmd("colorscheme gruvbox")
    end
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
    -- priority = 1000,
    -- config = function()
    --     require("catppuccin").setup({
    --         flavour = "auto",
    --         show_end_of_buffer = true,
    --         no_bold = true,
    --     })
    --     vim.cmd([[colorscheme catppuccin-mocha]])
    -- end
  },
  {
    "folke/tokyonight.nvim",
    -- priority = 1000,
    -- config = function()
    --     -- vim.opt.background = 'light'
    --     require("tokyonight").setup({
    --         transparent = true,
    --         styles = {
    --             comments = { italic = true },
    --             keywords = { italic = true },
    --             sidebars = "dark",
    --             floats = "dark",
    --         },
    --     })
    --     vim.cmd([[colorscheme tokyonight-night]])
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
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        -- highlight_groups = {
        --     TelescopeBorder = { fg = "highlight_high", bg = "none" },
        --     TelescopeNormal = { bg = "none" },
        --     TelescopePromptNormal = { bg = "base" },
        --     TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        --     TelescopeSelection = { fg = "text", bg = "base" },
        --     TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        -- },
      })
      -- vim.cmd([[colorscheme rose-pine]])
    end
  },
  {
    'NLKNguyen/papercolor-theme'
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        transparent = true,
        terminalColors = true,
        theme = "wave",
      })
    end
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }

      -- vim.cmd([[colorscheme poimandres]])
    end,

    -- optionally set the colorscheme within lazy config
    -- init = function()
    --   vim.cmd("colorscheme poimandres")
    -- end
  },
  {
    "EdenEast/nightfox.nvim",
    -- priority = 1000,
    -- config = function()
    --     vim.cmd([[colorscheme duskfox]])
    -- end
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme moonfly]])
    end
  },
  {
    'rafi/awesome-vim-colorschemes'
  },

  {
    "jackplus-xyz/binary.nvim",
    opts = {
      colors = {                -- Colors used for the "light" theme; reversed automatically for "dark"
        bg = "#d79921",         -- Foreground color
        fg = "#000000",         -- Background color
      },
    }
  },
  {
    "nickkadutskyi/jb.nvim",
  },
  {
    "xero/miasma.nvim",
  },
  {
    "Yazeed1s/oh-lucy.nvim"
  }
}
