return {
    "nvim-mini/mini.comment",
    version = "*",
    config = true,
    opts = {
        mappings = {
            comment = "gc",
            comment_line = "<leader>cc",
            comment_visual = "gc",
            textobject = "gc",
        },
    },
}
