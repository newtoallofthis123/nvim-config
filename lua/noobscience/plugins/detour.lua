return {
  "carbon-steel/detour.nvim",
  config = function()
    require("detour").setup({
      -- Put custom configuration here
    })
    vim.keymap.set('n', '<leader>qo', ":Detour<cr>")
    vim.keymap.set('n', '<leader>qp', ":DetourCurrentWindow<cr>")

    vim.keymap.set("n", "<leader>Gd", function()
      -- Open detour with the same buffer
      if not require("detour").Detour() then
        return
      end
      vim.lsp.buf.definition() -- jump to definition
    end)

    vim.keymap.set("n", "<leader>qt", function()
      local window_id = require("detour").Detour() -- open a detour
      if not window_id then
        return
      end

      vim.cmd.terminal()                  -- open a terminal buffer
      vim.bo.bufhidden = "delete"         -- close the terminal when window closes
      vim.wo[window_id].signcolumn = "no" -- In Neovim 0.10, the signcolumn can push the TUI a bit out of window

      -- It's common for people to have `<Esc>` mapped to `<C-\><C-n>` for terminals.
      -- This can get in the way when interacting with TUIs.
      -- This maps the escape key back to itself (for this buffer) to fix this problem.
      vim.keymap.set("t", "<Esc><Esc>", "<Esc>", { buffer = true })

      vim.cmd.startinsert() -- go into insert mode

      vim.api.nvim_create_autocmd({ "TermClose" }, {
        buffer = vim.api.nvim_get_current_buf(),
        callback = function()
          -- This automated keypress skips for you the "[Process exited 0]" message
          -- that the embedded terminal shows.
          vim.api.nvim_feedkeys("i", "n", false)
        end,
      })
    end)

    vim.keymap.set("n", "<leader>K", function()
      -- Open detour
      if not require("detour").Detour() then
        return
      end
      vim.cmd.edit("~/.config/nvim/init.lua") -- open Neovim config directory
    end)
  end
}
