return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",         -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
        config = function()
            -- set keymap
            local keymap = vim.keymap -- for conciseness
            keymap.set({ "n", "i", "v" }, "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end, { desc = "CopilotChat - Quick chat" })
            keymap.set({ "n", "i", "v" }, "<leader>cct",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end, { desc = "CopilotChat - Telescope" })

            keymap.set({ "n", "i", "v" }, "<leader>ccf", ":CopilotChatFix<CR>", { desc = "CopilotChat - Fix chat" })
            keymap.set({ "n", "i", "v" }, "<leader>ccd", ":CopilotChatDoc<CR>", { desc = "CopilotChat - Doc chat" })
            require("CopilotChat").setup()
        end
    }
}
