return {
  'copilotlsp-nvim/copilot-lsp',
  event = 'BufEnter',
  init = function()
    vim.g.copilot_nes_debounce = 250
    vim.lsp.enable 'copilot_ls'
    vim.keymap.set('n', '<tab>', function()
      local bufnr = vim.api.nvim_get_current_buf()
      local state = vim.b[bufnr].nes_state
      if state then
        vim.schedule(function()
          local _ = require('copilot-lsp.nes').walk_cursor_start_edit()
              or (require('copilot-lsp.nes').apply_pending_nes() and require('copilot-lsp.nes').walk_cursor_end_edit())
        end)
        return ''
      else
        return '<C-i>'
      end
    end, { desc = 'Accept Copilot NES suggestion', expr = true })
    vim.keymap.set('n', '<esc>', function()
      ---@diagnostic disable-next-line: empty-block
      if not require('copilot-lsp.nes').clear() then
        return '<esc>'
      end
      vim.keymap.set('n', '<leader>cr', function()
        require('copilot-lsp.nes').restore_suggestion()
        return nil
      end, { desc = 'Restore previous Copilot suggestion', expr = true })
    end)
  end,

  enabled = false
}
