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

    vim.keymap.set("n", "<leader>K", function()
      -- Open detour
      if not require("detour").Detour() then
        return
      end
      vim.cmd.edit("~/.config/nvim/init.lua") -- open Neovim config directory
    end)
  end
}
