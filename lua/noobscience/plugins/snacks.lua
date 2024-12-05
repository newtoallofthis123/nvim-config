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
        }
    },
    keys = {
        { "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    }
}
