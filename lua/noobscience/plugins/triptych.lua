return{
  'simonmclean/triptych.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'nvim-tree/nvim-web-devicons', -- optional
  },
    config = function ()
        require 'triptych'.setup()

        vim.keymap.set('n', '<leader>-', ':Triptych<CR>', { silent = true })
    end
}
