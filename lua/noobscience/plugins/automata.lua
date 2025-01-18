return{
    'eandrju/cellular-automaton.nvim',
    config = function ()
        vim.api.nvim_set_keymap('n', '<leader>cml', '<cmd>CellularAutomaton make_it_rain<CR>', { noremap = true, silent = true })
    end
}
