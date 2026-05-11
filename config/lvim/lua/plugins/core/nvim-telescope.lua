return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>pf", ":Telescope find_files theme=dropdown<CR>", desc = "Telescope Find Files" },
        { "<leader>ps", ":Telescope live_grep theme=dropdown<CR>",  desc = "Telescope Live Grep" },
        { "<leader>tf", ":Telescope quickfix theme=dropdown<CR>",   desc = "Telescope Quick Fix List" },
    },
}
