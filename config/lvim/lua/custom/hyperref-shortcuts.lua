local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local function copy_label_and_insert(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    vim.fn.setreg('"', selection.key)

    vim.schedule(function()
        vim.api.nvim_put({ selection.value }, "c", true, true)
    end)
end

local function make_hyperref(label, link)
    return "\\hyperref[" .. link .. "]{" .. label .. "}"
end

local function telescope_label_shortcuts()
    local shortcuts = dofile(".lvim/hyperref-shortcuts.lua")

    local labels = {}
    for label, data in pairs(shortcuts) do
        local link_str = data.cmd or (data.link and make_hyperref(label, data.link))
        if link_str then
            table.insert(labels, {
                label = label,
                link = link_str,
                -- add the description if present
                desc = data.desc or "",
            })
        end
    end

    pickers
        .new({}, {
            prompt_title = "LaTeX Labels Shortcuts",
            finder = finders.new_table({
                results = labels,
                entry_maker = function(entry)
                    return {
                        value = entry.link,
                        display = string.format("%s -> %s", entry.label, entry.link)
                            .. (entry.desc and " (" .. entry.desc .. ")" or ""),
                        ordinal = entry.label .. " " .. entry.link,
                        label = entry.label,
                        desc = entry.desc,
                    }
                end,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(_, map)
                map("i", "<CR>", copy_label_and_insert)
                map("n", "<CR>", copy_label_and_insert)
                return true
            end,
        })
        :find()
end

vim.keymap.set("n", "<leader>ls", telescope_label_shortcuts, { desc = "Search and copy LaTeX label shortcuts" })
