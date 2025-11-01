return {
  'y3owk1n/time-machine.nvim',
  cmd = {
    "TimeMachineToggle",
    "TimeMachinePurgeBuffer",
    "TimeMachinePurgeAll",
    "TimeMachineLogShow",
    "TimeMachineLogClear",
  },
  ---@type TimeMachine.Config
  opts = {},
  keys = {
    {
      "<leader>T",
      "",
      desc = "Time Machine",
    },
    {
      "<leader>Tt",
      "<cmd>TimeMachineToggle<cr>",
      desc = "[Time Machine] Toggle Tree",
    },
    {
      "<leader>Tx",
      "<cmd>TimeMachinePurgeCurrent<cr>",
      desc = "[Time Machine] Purge current",
    },
    {
      "<leader>Tl",
      "<cmd>TimeMachineLogShow<cr>",
      desc = "[Time Machine] Show log",
    },
  },
}
