return
{
    "folke/snacks.nvim",
    opts = {
        init = {
            -- your init configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        scratch = {
            name = "Bin",
            ft = "markdown"
        },
        bigfile = {
            notify = true,
        },
        indent = {
        },
        lazygit = {},
        quickfile = {
            enabled = false
        },
        terminal = {
        }
    },
    keys = {
        { "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>gb", function()
            Snacks.git.blame_line({})
        end },
        {
            "<leader>I", function()
            Snacks.indent.enable()
        end
        },
        {
            "<leader>gI", function()
            Snacks.indent.disable()
        end
        },
        {
            "<leader>gl", function()
            Snacks.lazygit.open({})
        end
        },
        {
            "<C-w>t", function()
            Snacks.terminal.toggle('fish')
        end
        }
    },
    config = function()
    end
}
