return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>pf", ":Telescope find_files<CR>", desc = "Telescope Find Files" },
        { "<leader>ps", ":Telescope live_grep<CR>",  desc = "Telescope Live Grep" },
        { "<leader>pr", ":Telescope resume<CR>",  desc = "Telescope Resume Search" },
        { "<leader>tf", ":Telescope quickfix<CR>",   desc = "Telescope Quick Fix List" },
    },
}
