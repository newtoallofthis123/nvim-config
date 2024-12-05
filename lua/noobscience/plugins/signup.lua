return {
    "Dan7h3x/signup.nvim",
    branch = "main",
    opts = {
        -- Your configuration options here
    },
    config = function(_, opts)
        require("signup").setup(opts)
    end,
    enabled = false
}
