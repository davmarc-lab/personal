return {
    "stevearc/aerial.nvim",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        highlight_on_hover = true,
        close_on_select = true,
        exact_symbol_positions = false,

        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
        layout = {
            placement = "edge",
            default_direction = "prefer_right",
        },
    },
    config = function(_, opts)
        require("aerial").setup(opts)
    end,
    keys = {
        {
            "<leader>pa",
            "<cmd>Telescope aerial<CR>",
            desc = "Telescope aerial symbols",
        },
    },
}
