local ls_loader = require("luasnip.loaders.from_lua")
local ls_code = require("luasnip.loaders.from_vscode")

local snippet_dir = ".snippets"

local function load_project_snippets()
    -- clears luasnip cache
    ls_loader.clean()
    -- look for snippet folder
    local local_snippet_path = vim.loop.cwd() .. "/" .. snippet_dir

    if vim.loop.fs_stat(local_snippet_path) then
        ls_code.lazy_load()
        ls_loader.lazy_load({
            paths = local_snippet_path,
        })
        vim.notify("Custom snippets loaded", vim.log.levels.INFO)
    end
end

-- load immediately on startup
load_project_snippets()

-- reload when directory changes
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        load_project_snippets()
    end,
})
