local vars = require("vars")

--- Takes a string or a list of strings representing commands to execute.
--- @param input (string | string[] | table)? string or a list of strings containing commands to execute. Note that "foo bar" is one command.
local function exec_list(input)
    if input == nil then
        return
    end
    --- Cast input into an array to iterate each command.
    --- @type string[]
    local items
    if type(input) == "string" then
        items = { input }
    else
        items = input
    end

    for _, cmd in ipairs(items) do
        hl.exec_cmd(cmd)
    end
end

--- This function run the given commands if the flag is true or not.
--- Ideally the flag should be mapped in `vars.lua` file.
--- `main` and `fallback` can be a string or an array of string, e.g., { "foo", "bar random" },
--- @param main string | table string or a list of strings representing each command line to execute. Note that "foo bar" is one command.
--- @param flag? boolean if true main commands will be executed, fallback in the other case, if fallback is empty no command will be executed.
--- @param fallback? string | string[] | table string or a list of strings representing each command line to execute if the flag is `false`.
local function enable(main, flag, fallback)
    if flag or flag == nil then
        exec_list(main)
    else
        exec_list(fallback)
    end
end

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd(vars.terminal)
    hl.exec_cmd("nm-applet")

    enable("discord", vars.enable.discord)
    enable("LD_PRELOAD=/usr/lib/spotify-adblock.so spotify")

    enable("quickshell", vars.enable.quickshell, { "hyprpaper", vars.bar, vars.notification })
end)
