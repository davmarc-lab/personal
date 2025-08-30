pragma Singleton

import Quickshell

Singleton {
    id: settings

    readonly property var shellName: "quickshell"

    readonly property var shellPath: Quickshell.env("HOME") + "/.config/" + shellName + "/"

    readonly property var configsPath: shellPath + "configs/"
}
