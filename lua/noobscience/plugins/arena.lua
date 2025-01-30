return {
    "dzfrias/arena.nvim",
    event = "BufWinEnter",
    config = function()
        require("arena").setup({
            max_items = 5,
            ignore_current = true,
            per_project = true,
            devicons = true,
            keybinds = {
            },
        })
        vim.keymap.set("n", "<leader>a", function() require("arena").toggle() end)
    end,
    enabled = false
}
