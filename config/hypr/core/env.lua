-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local vars = require("vars")
local gsettings = vars.theme.gsettings

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- For NVIDIA drivers
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Dark theme on Qt apps
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Dark theme on GTK apps
hl.exec_cmd(string.format("gsettings set org.gnome.desktop.interface color-scheme '%s'", gsettings.colorscheme))
hl.exec_cmd(string.format("gsettings set org.gnome.desktop.interface gtk-theme '%s'", gsettings.gtk_theme))
