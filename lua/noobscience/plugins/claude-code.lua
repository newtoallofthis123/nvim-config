return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = "ClaudeCode",
  config = function()
    require("claudecode").setup({
      terminal = {
        split_side = "left",
        provider = "snacks",
        snacks_win_opts = {
          keys = {
            term_normal = {
              "<esc>",
              function(self)
                local mode = vim.fn.mode()
                if mode == "t" then
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
                  self.double_esc_timer = self.double_esc_timer or vim.loop.new_timer()
                  if self.double_esc_timer then
                    self.double_esc_timer:start(200, 0, function()
                      self.double_esc_timer = nil
                    end)
                  end
                end
              end,
              mode = "t",
              expr = true,
              desc = "Double escape to normal mode"
            },
            claude_switch_buffer = {
              "<C-/>",
              function(self)
                vim.cmd("wincmd p")
              end,
              mode = "t",
              desc = "Switch to previous buffer"
            }
          }
        }
      }
    })
  end,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCodeFocus<cr>",       desc = "Toggle Claude",      mode = { "n", "t" } },
    { "<C-/>",      "<cmd>ClaudeCodeFocus<cr>",       desc = "Claude Code",        mode = { "n", "t" } },
    { "<C-,>",      "<cmd>ClaudeCode<cr>",            desc = "Claude Code",        mode = { "n", "t" } },
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
