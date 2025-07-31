return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { '<leader>pf', ':Telescope find_files theme=dropdown<CR>', desc = "Telescope Find Files" },
        { '<leader>ps', ':Telescope live_grep theme=dropdown<CR>', desc = "Telescope Live Grep" },
        { '<leader>tf', ':Telescope quickfix theme=dropdown<CR>', desc = "Telescope Quick Fix List" },
    },
}
