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
  end,
}
