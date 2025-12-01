return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
        })

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-S-Q>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():next() end)
    end,
}
