local cores = 6
return {
    name = "CMake Build Preset",
    desc = "Configure and build the CMake project with the deafult preset",
    builder = function()
        local build_dir = "build"

        return {
            cmd = { "sh", "-c" },
            args = {
                string.format(
                    "rm -rf %s && cmake --preset default && cmake --build %s -j %s",
                    build_dir,
                    build_dir,
                    cores
                ),
            },
            components = {
                "default",
            },
        }
    end,
}
