return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            theme = 'ivy',
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                find_files = {
                    theme = 'ivy'
                },
                buffers = {
                    theme = 'ivy'
                },
            },
            extensions = {
                fzf = {}
            },
            defaults = {
                path_display = { "truncate " },
                -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("emoji")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        local cwd = vim.fn.getcwd()

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>w", "<cmd>Telescope frecency", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>e", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<cr>", { desc = "Find emoji" })
        keymap.set("n", "<leader>xx", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })
    end,
}
