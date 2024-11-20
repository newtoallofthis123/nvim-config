return {
    'github/copilot.vim',
    event = "VimEnter",
    init = function()
        vim.g.copilot_workspace_folders = { vim.fn.getcwd() }
    end
    -- enabled = false,
}
