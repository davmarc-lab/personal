return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
        {
            "<leader>ss",
            function()
                require("persistence").select()
            end,
            desc = "Select Session",
        },
        {
            "<leader>sL",
            function()
                require("persistence").load({ last = true })
            end,
            desc = "Restore Last Session",
        },
        {
            "<leader>sd",
            function()
                require("persistence").stop()
            end,
            desc = "Don't Save Current Session",
        },
    },
}
