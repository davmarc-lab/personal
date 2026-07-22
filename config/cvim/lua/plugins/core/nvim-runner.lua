return {
    "stevearc/overseer.nvim",
    keys = {
        { "<leader>rt", "<cmd>OverseerToggle<CR>", desc = "Toggle Overseer Task Runner" },
        { "<leader>rr", "<cmd>OverseerRun<CR>",    desc = "Open Overseer Runner" },
    },
    opts = {
        task_list = {
            keymaps = {
                ["r"] = { "keymap.run_action", opts = { action = "restart" }, desc = "Restart task" },
                ["s"] = { "keymap.run_action", opts = { action = "stop" }, desc = "Stop task" },
            },
        },
    },
    config = function(_, opts)
        local overseer = require("overseer")
        overseer.setup(opts)

        -- Automatically open the task list on run
        overseer.add_template_hook(nil, function(_)
            overseer.open({ enter = false })
        end)
    end,
}
