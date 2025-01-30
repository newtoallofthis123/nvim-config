return {
    'karshPrime/tmux-compile.nvim',
    event = 'VeryLazy',
    config = function()
        require('tmux-compile').setup({
            save_session = true,
            build_run_window_title = "build", 
            ---- same window pane
            new_pane_everytime = false,   -- Use existing side panes for action, when false
            side_width_percent = 50,      -- Side pane width percentage
            bottom_height_percent = 30,   -- Bottom pane height percentage
            overlay_width_percent = 80,   -- Overlay width percentage
            overlay_height_percent = 80,  -- Overlay height percentage
            overlay_sleep = 3,            -- Pause before overlay autoclose; seconds
            build_run_config = {
                {
                    extension = { 'c', 'cpp', 'h' },
                    build = 'make',
                    run = 'make run',
                    debug = 'lldb',
                },
                {
                    extension = { 'rs' },
                    build = 'cargo build',
                    run = 'cargo run',
                },
                {
                    extension = { 'go' },
                    run = 'make run',
                    build = 'make build',
                }, {
                extension = { 'java' },
                run = '/opt/gradle/gradle-8.11.1/bin/gradle build'
            }
            }
        })

        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>rvb", "<cmd>TMUXcompile MakeV<cr>", { desc = "Make in a tmux vertical window" })
        keymap.set("n", "<leader>rvr", "<cmd>TMUXcompile RunV<cr>", { desc = "Run in a tmux vertical window" })
        keymap.set("n", "<leader>rhb", "<cmd>TMUXcompile MakeH<cr>", { desc = "Make in a tmux horizontal window" })
        keymap.set("n", "<leader>rhr", "<cmd>TMUXcompile RunH<cr>", { desc = "Run in a tmux horizontal window" })
        keymap.set("n", "<leader>rB", "<cmd>TMUXcompile MakeBG<cr>", { desc = "Make in a new tmux window" })
        keymap.set("n", "<leader>rR", "<cmd>TMUXcompile RunBG<cr>", { desc = "Run in a new tmux window" })
    end,
    enable = false,
}
