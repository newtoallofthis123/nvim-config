return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local keymap = vim.keymap                                                                  -- for conciseness

        keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    end,
}
