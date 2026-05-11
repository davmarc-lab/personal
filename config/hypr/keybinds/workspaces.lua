local vars = require("vars")

-- Switch workspaces with vars.mod + [0-9]
-- Move active window to a workspace with vars.mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(vars.mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(vars.mod .. " + s", hl.dsp.workspace.toggle_special("magic"))
hl.bind(vars.mod .. " + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with vars.mod + LMB/RMB and dragging
hl.bind(vars.mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
