return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
    },
    config = function()
        require("barbecue").setup()
        vim.keymap.set("n", "<leader>[", function() require("barbecue.ui").toggle() end)
    end,
    enabled = false
}
