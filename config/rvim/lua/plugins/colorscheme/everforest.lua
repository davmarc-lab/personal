return {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    opts = {
        background = "hard",
    },
    config = function(opts)
        require("everforest").setup(opts)
    end,
}
