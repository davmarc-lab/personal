return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map("n", "<leader>hd", function() gs.diffthis(vim.lsp.bufnr) end)
            map("n", "<leader>hD", function() gs.diffthis("~") end)

        end
    },
}

