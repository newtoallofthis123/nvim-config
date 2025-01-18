return { {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = false,
                keymap = {
                    accept = "<C-'>",
                    accept_word = "<C-y>",
                    next = "<C-]>",
                    prev = "<C-[>",
                },
            },
            panel = { enabled = false },
        })

        vim.cmd([[Copilot disable]])
    end,
    -- enabled = false
} }
