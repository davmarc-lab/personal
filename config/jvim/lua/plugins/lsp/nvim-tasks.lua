return {
    {
        "stevearc/overseer.nvim",
        opts = {
            -- This allows Overseer to automatically find pom.xml or build.gradle
            templates = { "builtin", "gradle" },
            task_list = {
                keymaps = {
                    ["r"] = { "keymap.run_action", opts = { action = "restart" }, desc = "Restart Task" },
                },
            },
        },
        config = function(_, opts)
            require("overseer").setup(opts)
            --
            -- -- Keybindings to trigger the runner
            vim.keymap.set("n", "<leader>rr", "<cmd>OverseerOpen<CR><cmd>OverseerRun<CR>", { desc = "Run Task" })
            vim.keymap.set("n", "<leader>rt", "<cmd>OverseerToggle<CR>", { desc = "Toggle Task List" })
        end,
    },
}
