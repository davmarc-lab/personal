return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "folke/snacks.nvim",
        },
        config = function(_, opts)
            require("neo-tree").setup({
                commands = {
                    snacks_pick_open = function(state, open_cmd)
                        local node = state.tree:get_node()
                        if node.type ~= "file" then
                            return
                        end
                        local path = node:get_id()
                        local win = require("snacks").picker.util.pick_win({
                            filter = function(w)
                                -- Don't pick the neo-tree window or other sidebars
                                return vim.bo[vim.api.nvim_win_get_buf(w)].filetype ~= "neo-tree"
                            end,
                        })
                        if win then
                            vim.api.nvim_set_current_win(win)
                            vim.cmd(open_cmd .. " " .. vim.fn.fnameescape(path))
                        end
                    end,

                    open_with_snacks = function(state)
                        state.commands.snacks_pick_open(state, "edit")
                    end,
                    split_with_snacks = function(state)
                        state.commands.snacks_pick_open(state, "split")
                    end,
                    vsplit_with_snacks = function(state)
                        state.commands.snacks_pick_open(state, "vsplit")
                    end,
                },
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                        ["w"] = "open_with_snacks",
                        ["s"] = "vsplit_with_snacks",
                        ["S"] = "split_with_snacks",
                    },
                },
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
                use_libuv_file_watcher = true,
            })
        end,
        keys = {
            {
                "<C-n>",
                "<cmd>Neotree toggle left<CR>",
            },
            {
                "<C-g>",
                "<cmd>Neotree toggle float git_status<CR>",
            },
            {
                "<C-b>",
                "<cmd>Neotree toggle float buffers<CR>",
            },
        },
    },
}
