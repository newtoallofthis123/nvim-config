return {
  "nvim-focus/focus.nvim",
  version = "*",
  config = function()
    require("focus").setup({
      split = {
        bufnew = false,
      },
      autoresize = {
        enable = false,
      },
      ui = {
        number = true,
        relativenumber = false,
        cursorline = true,
        signcolumn = false,
        winhighlight = false,
      },
    })

    local focusmap = function(direction)
      vim.keymap.set("n", "<leader>w" .. direction, function()
        require("focus").split_command(direction)
      end, { desc = string.format("Create or move to %s split", direction) })
    end

    focusmap("h")
    focusmap("j")
    focusmap("k")
    focusmap("l")

    vim.keymap.set("n", "<leader>wo", "<cmd>FocusSplitCycle<cr>", { desc = "Cycle through splits" })

    vim.keymap.set("n", "<leader>wq", function()
      if vim.fn.winnr('$') > 1 then
        vim.cmd('close')
      else
        print("Cannot close last window")
      end
    end, { desc = "Close split (keep buffer)" })

    vim.keymap.set("n", "<leader>wk", function()
      if vim.fn.winnr('$') > 1 then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.cmd('close')
        if vim.fn.buflisted(bufnr) == 1 and #vim.fn.getbufinfo(bufnr, { buflisted = 1 })[1].windows == 0 then
          vim.cmd('bdelete ' .. bufnr)
        end
      else
        print("Cannot close last window")
      end
    end, { desc = "Close split and kill buffer" })

    local ignore_filetypes = { 'snacks_picker', 'snacks_picker_list', 'snacks_picker_input', 'snacks_picker_preview' }
    local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

    local augroup =
        vim.api.nvim_create_augroup('FocusDisable', { clear = true })

    vim.api.nvim_create_autocmd('WinEnter', {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
      desc = 'Disable focus autoresize for BufType',
    })

    vim.api.nvim_create_autocmd('FileType', {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
      desc = 'Disable focus autoresize for FileType',
    })
  end
}
