return {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set('n', '<leader>mu', function() require("duck").hatch("🦖") end, {})
        vim.keymap.set('n', '<leader>mk', function() require("duck").cook() end, {})
        vim.keymap.set('n', '<leader>ma', function() require("duck").cook_all() end, {})
    end
}
