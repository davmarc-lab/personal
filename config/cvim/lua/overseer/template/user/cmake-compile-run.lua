local cores = 6
return {
    name = "CMake Compile and Run Executable",
    desc = "Compile and Run binary from build/bin",

    generator = function(_, cb)
        local files = vim.fn.globpath(".", "**/build/bin/**", false, true)
        local tasks = {}

        for _, file in ipairs(files) do
            if vim.fn.executable(file) == 1 and vim.fn.isdirectory(file) == 0 then
                local exec_path = file
                local work_dir = vim.fn.fnamemodify(exec_path, ":h")
                local file_name = vim.fn.fnamemodify(exec_path, ":t")
                local build_dir = "build"

                table.insert(tasks, {
                    name = "Compile & Run: " .. file_name .. " (" .. work_dir .. ")",
                    builder = function()
                        return {
                            cmd = { "sh", "-c" },
                            args = {
                                string.format("cmake --build %s -j %s && %s", build_dir, cores, exec_path),
                            },
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
