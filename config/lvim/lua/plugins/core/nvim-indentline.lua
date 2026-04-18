return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {},
    config = function()
        local indent = {
            char = "▏",
        }

        require("ibl").setup({
            scope = {
                enabled = false,
            },
            indent = indent,
        })
    end,
}
