local vars = require("vars")

if vars.enable.quickshell then
    hl.bind(vars.mod .. " + u", hl.dsp.exec_cmd("qs ipc call utility toggle"))
    hl.bind(vars.mod .. " + w", hl.dsp.exec_cmd("qs ipc call dock toggle"))
    hl.bind(vars.mod .. " + n", hl.dsp.exec_cmd("qs ipc call side toggle"))
end
