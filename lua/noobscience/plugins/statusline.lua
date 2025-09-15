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
        vim.api.nvim_set_hl(0, 'WinBar', { bg = nil })
        vim.api.nvim_set_hl(0, 'WinBarNC', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarHover', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarIconKindDefault', { bg = nil })
        vim.api.nvim_set_hl(0, 'DropBarIconKindDefaultNC', { bg = nil })
      end
    })

    -- Set highlights immediately as well
    vim.api.nvim_set_hl(0, 'WinBar', { bg = nil })
    vim.api.nvim_set_hl(0, 'WinBarNC', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarHover', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarIconKindDefault', { bg = nil })
    vim.api.nvim_set_hl(0, 'DropBarIconKindDefaultNC', { bg = nil })
  end
}
