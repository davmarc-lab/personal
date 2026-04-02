local split_right = {
    preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.5,
    },
}

return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            qflist = split_right,
            diagnostics = split_right,
            cascade = {
                mode = "diagnostics",
                filter = function(items)
                    local severity = vim.diagnostic.severity.HINT
                    for _, item in ipairs(items) do
                        severity = math.min(severity, item.severity)
                    end
                    return vim.tbl_filter(function(item)
                        return item.severity == severity
                    end, items)
                end
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>td",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
}

