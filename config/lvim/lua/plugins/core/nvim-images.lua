return {
    "HakonHarnes/img-clip.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    opts = {
        default = {
            file_name = "%Y%m%d_%H%M%S",
            prompt_for_file_name = true,
        },
        filetypes = {
            tex = {
                relative_template_path = false,
                template = [[\includegraphics[width=.8\textwidth]{$FILE_PATH}
\caption{$CURSOR}
\label{fig:$LABEL}
]],
                formats = { "jpeg", "jpg", "png", "pdf" },
            },
        }
    },
    keys = {
        { "<leader>pa", "<cmd>PasteImage<cr>", desc = "[P]aste [a]sset from system clipboard" },
        {
            "<leader>pi",
            function()
                local telescope = require("telescope.builtin")
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                telescope.find_files({
                    search_dirs = { "./assets/" },
                    attach_mappings = function(_, map)
                        local function embed_image(prompt_bufnr)
                            local entry = action_state.get_selected_entry()
                            local filepath = entry[1]
                            actions.close(prompt_bufnr)

                            local img_clip = require("img-clip")
                            img_clip.paste_image(nil, filepath)
                        end

                        map("i", "<CR>", embed_image)
                        map("n", "<CR>", embed_image)

                        return true
                    end,
                })
            end,
            desc = "[P]ick [i]mage from files"
        },
    },
}
