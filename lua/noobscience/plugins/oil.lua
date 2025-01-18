return {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
        require('oil').setup({
            default_file_explorer = false,
            columns = {
                "icon",
                "size"
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true
            }
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        vim.keymap.set("n", "<leader>t", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
