local cores = 6
return {
    name = "CMake Build",
    desc = "Configure and build the CMake project",
    builder = function()
        local build_dir = "build"

        return {
            cmd = { "sh", "-c" },
            args = {
                string.format("cmake -B %s && cmake --build %s -j %s", build_dir, build_dir, cores),
            },
            components = {
                "default",
            },
        }
    end,
}
