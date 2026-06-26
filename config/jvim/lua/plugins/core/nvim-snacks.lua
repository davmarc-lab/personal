-- UI improvements and notifications

-- LSP progress bar
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(vim.lsp.status(), "info", {
            id = "lsp_progress",
            title = "LSP Progress",
            opts = function(notif)
                notif.icon = ev.data.params.value.kind == "end" and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true },
        debug = { enabled = true },
        gh = {
            enabled = true,
        },
        git = { enabled = true },
        indent = {
            enabled = true,
            char = "▏",
            animate = {
                enabled = false,
            },
        },
        input = { enabled = true },
        layout = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        picker = { enabled = true },
        quickfile = {
            enabled = true,
            exclude = { "latex" },
        },
        rename = { enabled = true },
        statuscolumn = { enabled = true },
        util = { enabled = true },
        win = { enabled = true },

        bufdelete = { enabled = false },
        dashboard = { enabled = false },
        dim = { enabled = false },
        explorer = { enabled = false },
        gitbrowse = { enabled = false },
        image = { enabled = false },
        keymap = { enabled = false },
        lazygit = { enabled = false },
        profiler = { enabled = false },
        scope = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        terminal = { enabled = false },
        toggle = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },
    },
    keys = {
        -- gh
        {
            "<leader>gi",
            function()
                Snacks.picker.gh_issue()
            end,
            desc = "GitHub Issues (open)",
        },
        {
            "<leader>gI",
            function()
                Snacks.picker.gh_issue({ state = "all" })
            end,
            desc = "GitHub Issues (all)",
        },
        {
            "<leader>gp",
            function()
                Snacks.picker.gh_pr()
            end,
            desc = "GitHub Pull Requests (open)",
        },
        {
            "<leader>gP",
            function()
                Snacks.picker.gh_pr({ state = "all" })
            end,
            desc = "GitHub Pull Requests (all)",
        },
        -- notif
        {
            "<leader>nh",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Show Notification History",
        },
    },
}
