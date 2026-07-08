local ls_loader = require("luasnip.loaders.from_lua")

local snippet_dir = ".snippets"

local function load_project_snippets()
    -- look for snippet folder
    local local_snippet_path = vim.loop.cwd() .. "/" .. snippet_dir

    if vim.loop.fs_stat(local_snippet_path) then
        vim.notify("Found custom snippets folder", vim.log.levels.INFO)
        ls_loader.load({ paths = local_snippet_path })
        vim.notify("Loading snippets", vim.log.levels.INFO)
    end
end

-- load immediately on startup
load_project_snippets()

-- reload when directory changes
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        -- clears luasnip cache
        ls_loader.unload()
        load_project_snippets()
    end,
})
