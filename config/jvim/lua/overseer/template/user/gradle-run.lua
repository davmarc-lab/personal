return {
    name = "Gradle Run",
    params = {
        args = { type = "string", default = "run" },
    },
    builder = function(params)
        -- 1. Determine if we should use the wrapper or the system gradle
        local cmd = vim.fn.executable("gradle") == 1 and "gradle" or "./gradlew"
        return {
            cmd = { cmd },
            args = { params.args },
            components = {
                { "on_output_summarize" },
                "unique",
                "default",
            },
        }
    end,
    condition = {
        callback = function()
            -- 2. Only show this template if a gradle file exists in the CWD
            return vim.fn.glob("build.gradle*") ~= ""
        end,
    },
}
