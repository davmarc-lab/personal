return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            cache = false,
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            borderless_telescope = true,
            terminal_colors = false,
        })
    end,
}
