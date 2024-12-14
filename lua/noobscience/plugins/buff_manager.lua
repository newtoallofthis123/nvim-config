return {
    'j-morano/buffer_manager.nvim',
    config = function()
        require('buffer_manager').setup()
        -- set the keymap to open the buffer manager
        vim.keymap.set('n', '<C-e>', require('buffer_manager.ui').toggle_quick_menu, { desc = 'Open buffer manager' })
    end,
}
