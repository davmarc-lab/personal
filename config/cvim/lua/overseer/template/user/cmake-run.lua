return {
    name = "CMake Run Executable",
    desc = "Run a compiled binary from build/bin",

    generator = function(_, cb)
        local files = vim.fn.globpath(".", "**/build/bin/**", false, true)
        local tasks = {}

        for _, file in ipairs(files) do
            if vim.fn.executable(file) == 1 and vim.fn.isdirectory(file) == 0 then
                local exec_path = file
                local work_dir = vim.fn.fnamemodify(exec_path, ":h")
                local file_name = vim.fn.fnamemodify(exec_path, ":t")

                table.insert(tasks, {
                    name = "Run: " .. file_name .. " (" .. work_dir .. ")",
                    builder = function()
                        return {
                            cmd = { exec_path },
                            cwd = vim.fn.getcwd(),
                            components = {
                                "default",
                            },
                        }
                    end,
                })
            end
        end

        cb(tasks)
    end,
}
