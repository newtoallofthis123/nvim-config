return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = "ClaudeCode",
  config = function()
    require("claudecode").setup({
      auto_start = true,
      terminal = {
        provider = "none"
      }
    })
  end,
  keys = {
    { "<leader>aC",  "<cmd>ClaudeCodeStart<cr>",      desc = "Start the claude code server" },
    { "<leader>ab",  "<cmd>ClaudeCodeAdd %<cr>",      desc = "Add current buffer" },
    { "<leader>as",  "<cmd>ClaudeCodeSend<cr>",       mode = "v",                           desc = "Send to Claude" },
    { "<leader>ada", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>adf", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
