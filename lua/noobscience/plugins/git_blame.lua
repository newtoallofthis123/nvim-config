return {
    'braxtons12/blame_line.nvim',
    config = function()
        require('blame_line').setup({
            show_in_insert = false,
            show_in_visual = false,
        })

        vim.cmd [[
            BlameLineDisable
        ]]
    end
}
