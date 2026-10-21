hl.window_rule({
    name = "rule-terms",
    match = {
        class = "kitty|Alacritty|Code",
    },
    workspace = "1 silent",
})

hl.window_rule({
    name = "rule-browsers",
    match = {
        class = "firefox",
    },
    workspace = "2 silent",
})

hl.window_rule({
    name = "rule-launchers",
    match = {
        class = "steam|heroic",
    },
    workspace = "3 silent",
})

hl.window_rule({
    name = "rule-draw",
    match = {
        class = "Blender",
    },
    workspace = "4 silent",
})

hl.window_rule({
    name = "rule-ds",
    match = {
        class = "discord",
    },
    workspace = "9 silent",
})

hl.window_rule({
    name = "rule-teams",
    match = {
        class = "^(Microsoft Teams - Preview)$",
    },
    workspace = "7 silent",
})

hl.window_rule({
    name = "rule-tg",
    match = {
        class = "org.telegram.desktop",
    },
    workspace = "8 silent",
})

hl.window_rule({
    name = "rule-music",
    match = {
        class = "Spotify",
    },
    workspace = "10 silent",
})
