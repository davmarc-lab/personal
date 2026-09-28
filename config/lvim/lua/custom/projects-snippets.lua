local ls_loader = require("luasnip.loaders.from_lua")
local ls_code = require("luasnip.loaders.from_vscode")

local snippet_dir = ".snippets"
local last_loaded_path = nil

local function load_project_snippets()
    local current_cwd = vim.uv.cwd()
    local local_snippet_path = current_cwd .. "/" .. snippet_dir

    -- Prevent redundant reloading if the directory hasn't genuinely changed
    if last_loaded_path == local_snippet_path then
        return
    end

    if vim.uv.fs_stat(local_snippet_path) then
        -- Only clear and load if the path exists and changed
        ls_loader.clean()
        ls_code.lazy_load()
        ls_loader.lazy_load({
            paths = local_snippet_path,
        })
        last_loaded_path = local_snippet_path
        vim.notify("Custom snippets loaded", vim.log.levels.INFO)
    end
end

-- Load immediately on startup
load_project_snippets()

-- Use a more specific autocommand or check to prevent false triggers
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        load_project_snippets()
    end,
})
