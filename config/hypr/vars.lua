-- This read only table allow to modularize custom commands, applications, system theme and startup applications.
-- [NOTE] - Startup applications need to be called in core.autostart

local vars = {
    mod = "SUPER",
    terminal = "kitty",
    alt_terminal = "alacritty",
    fileManager = "dolphin",
    menu = "wofi --show drun",
    bar = "waybar",
    notification = "dunst",
    capture = {
        -- capture region
        region = "hyprshot --freeze -m region --clipboard-only",
        -- capture selected window
        window = "hyprshot --freeze -m window --clipboard-only",
        -- capture current focused monitor
        screen =
        "hyprshot -m output -m $(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name') --clipboard-only",
    },
    theme = {
        gsettings = {
            gtk_theme = "Adwaita-dark",
            colorscheme = "prefer-dark",
        },
    },
    enable = {
        quickshell = false,
        discord = true,
    },
}

local proxy = {}
local mt = {
    __index = vars,
    __newindex = function()
        error("Attempt to modify a read-only utility file!", 2)
    end,
}

setmetatable(proxy, mt)

return proxy
