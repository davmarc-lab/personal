vim.pack.add({
    {
        src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
        version = vim.version.range("3"),
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- "https://github.com/folke/snacks.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
    window = {
        mappings = {
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            -- ["r"] = "rename_with_snacks"
        },
    },
    -- commands = {
    --     rename_with_snacks = function (state)
    --         local node = state.tree:get_node()
    --         require("snacks").rename.rename_file({ from = node.path })
    --     end
    -- },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = true,
        },
    },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
    },
})
