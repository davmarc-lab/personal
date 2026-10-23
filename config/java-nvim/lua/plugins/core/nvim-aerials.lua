return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        layout = {
            placement = "edge",
        },
    },
    config = function(_, opts)
        require("aerial").setup(opts)
    end,
    keys = {
        {
            "<leader>pa",
            "<cmd>Telescope aerial<CR>",
            desc = "Telescope aerial symbols"
        },
    },
}
