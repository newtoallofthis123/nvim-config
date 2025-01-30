return {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    opts = {},
    config = function()
        require("quicker").setup({
            opts = {
                buflisted = false,
                number = false,
                relativenumber = false,
                signcolumn = "auto",
                winfixheight = true,
                wrap = false,
            },
        })
        vim.keymap.set("n", "<leader>Q", function()
            require("quicker").toggle()
        end, {
            desc = "Toggle quickfix",
        })
        vim.keymap.set("n", "<leader>l", function()
            require("quicker").toggle({ loclist = true })
        end, {
            desc = "Toggle loclist",
        })
    end
}
