return {
    'nvim-focus/focus.nvim',
    version = '*',
    config = function()
        require("focus").setup({
            spilt = {
                bufnew = true
            },
            ui = {
                number = true,
                -- relativenumber = true,
            }
        })
        local focusmap = function(direction)
            vim.keymap.set('n', '<leader>w' .. direction, function()
                require('focus').split_command(direction)
            end, { desc = string.format('Create or move to split (%s)', direction) })
        end

        focusmap('h')
        focusmap('j')
        focusmap('k')
        focusmap('l')

        vim.keymap.set('n', '<leader>w=', "<cmd>FocusEqualise<cr>", {desc = "Equalize Splits"})
        vim.keymap.set('n', '<leader>w+', "<cmd>FocusMaximise<cr>", {desc = "Current Maximize Split"})
    end
}
