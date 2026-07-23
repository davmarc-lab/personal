return {
    "nvim-mini/mini.comment",
    version = "*",
    config = function(_)
        require("mini.comment").setup({
            mappings = {
                comment = "gc",
                comment_line = "<leader>cc",
                comment_visual = "gc",
                textobject = "gc",
            },
        })
    end,
}
