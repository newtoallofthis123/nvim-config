return {
    'karshPrime/tmux-compile.nvim',
    event = 'VeryLazy',
    config = function()
        require('tmux-compile').setup({
            save_session = false,         -- Save file before action (:wall)
            build_run_window_title = "build", -- Tmux window name for Build/Run
            ---- same window pane
            new_pane_everytime = false,   -- Use existing side panes for action, when false
            side_width_percent = 50,      -- Side pane width percentage
            bottom_height_percent = 30,   -- Bottom pane height percentage
            ---- overlay window
            overlay_width_percent = 80,   -- Overlay width percentage
            overlay_height_percent = 80,  -- Overlay height percentage
            overlay_sleep = 1,            -- Pause before overlay autoclose; seconds
            -- By default it sets value to -1,
            -- indicating not to autoclose overlay

            -- Languages' Run and Build actions.  [REQUIRED]
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
                    -- not all properties are required for all extensions
                },
                {
                    extension = { 'go' },
                    run = 'go run .',
                    -- Run would work for golang
                    -- but Build and Debug will return errors informing configs are
                    -- missing
                }, {
                extension = { 'java' },
                run = '/opt/gradle/gradle-8.11.1/bin/gradle build'
            }
            }
        })

        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>rb", "<cmd>TMUXcompile Make<cr>", { desc = "Make in a tmux window" })
        keymap.set("n", "<leader>rr", "<cmd>TMUXcompile Run<cr>", { desc = "Run in a tmux window" })
    end,
    enable = false,
}
