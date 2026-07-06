local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local function copy_label_to_clipboard(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    vim.fn.setreg('"', selection.value)
end

local function telescope_label_search()
    -- look for main.aux file in build dir (see plugins/core/nvim-latex.lua)
    local aux_file = "build/main.aux"
    -- finds all newlabel and removes @cref ones
    local cmd = "grep -oP '(?<=newlabel{)([^}]+)}{{([^}]+)}{([^}]+)}{([^}]+)' " .. aux_file .. " | grep -v '@cref'"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()

    local labels = {}
    for line in string.gmatch(result, "[^\r\n]+") do
        -- Structure: {key}{{number}{page}{text}
        local key, _, _, text = string.match(line, "([^}]+)}{{([^}]+)}{([^}]+)}{([^}]+)")

        if key and text then
            local display_text = (string.match(text, "\\relax") == nil) and text or ""
            table.insert(labels, {
                value = key,
                display = key .. (display_text ~= "" and (" -> " .. display_text) or ""),
                ordinal = key .. (display_text ~= "" and (" " .. display_text) or ""),
            })
        end
    end

    pickers
        .new({}, {
            prompt_title = "LaTeX Labels",
            finder = finders.new_table({
                results = labels,
                entry_maker = function(entry)
                    return {
                        value = entry.value,
                        display = entry.display,
                        ordinal = entry.ordinal,
                    }
                end,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(_, map)
                map("i", "<CR>", copy_label_to_clipboard)
                map("n", "<CR>", copy_label_to_clipboard)
                return true
            end,
        })
        :find()
end

-- Map this to a key, e.g., <leader>ll
vim.keymap.set("n", "<leader>ll", telescope_label_search, { desc = "Search and copy LaTeX labels" })
