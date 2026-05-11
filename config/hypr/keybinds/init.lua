local vars = require("vars")

hl.bind(vars.mod .. " + Return", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mod .. " + SHIFT + Return", hl.dsp.exec_cmd(vars.alt_terminal))
hl.bind(vars.mod .. " + SHIFT + q", hl.dsp.window.close())

hl.bind(
    vars.mod .. " + m",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(vars.mod .. " + v", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.mod .. " + d", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mod .. " + p", hl.dsp.window.pseudo())
hl.bind(vars.mod .. " + e", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with vars.mod + arrow keys
hl.bind(vars.mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Clients maximize and fullscreen toggle
hl.bind(vars.mod .. " + f", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(vars.mod .. " + SHIFT + f", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.bind("Print", hl.dsp.exec_cmd(vars.capture.region))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(vars.capture.window))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd(vars.capture.screen))

require("keybinds.audio")
require("keybinds.workspaces")

-- hl.bind(vars.mod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
