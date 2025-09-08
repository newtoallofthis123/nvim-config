return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  config = function()
    local dropbar_api = require('dropbar.api')
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

    require('dropbar').setup({
      icons = {
        kinds = {
          dir_icon = '',
        }
      }
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'WinBar', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarHover', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarIconKindDefault', { bg = '#111111' })
        vim.api.nvim_set_hl(0, 'DropBarIconKindDefaultNC', { bg = '#111111' })
      end
    })

    -- Set highlights immediately as well
    vim.api.nvim_set_hl(0, 'WinBar', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarHover', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindDefault', { bg = '#111111' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindDefaultNC', { bg = '#111111' })
  end
}
