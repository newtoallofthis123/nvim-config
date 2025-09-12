return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd="ClaudeCode",
  config = function()
    require("claudecode").setup({
      terminal = {
        split_side = "left",
        provider = "snacks",
        snacks_win_opts = {
          keys = {
            claude_toggle = {
              "<C-/>",
              function(self)
                vim.cmd("wincmd l")
              end,
              mode = "t",
              desc = "Go to Left",
            },
            claude_hide = {
              "<C-,>",
              function(self)
                self:hide()
                -- vim.cmd("wincmd l")
              end,
              mode = "t",
              desc = "hide",
            },
          },
        },
      }
    })
  end,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>as", "<cmd>ClaudeCodeFocus<cr>",       desc = "Toggle Claude" },
    { "<C-/>",      "<cmd>ClaudeCodeFocus<cr>",       desc = "Claude Code",        mode = { "n", "x" } },
    { "<C-,>",      "<cmd>ClaudeCode<cr>",            desc = "Claude Code",        mode = { "n", "x" } },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
