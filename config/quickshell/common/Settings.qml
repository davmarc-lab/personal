pragma Singleton

import Quickshell

Singleton {
    id: settings

    readonly property var shellName: "quickshell"

    readonly property var shellPath: Quickshell.env("HOME") + "/.config/" + shellName + "/"

    // readonly property var configsPath: shellPath + "configs/"
    readonly property var configsPath: Quickshell.env("HOME") + "/git-packages/personal/config/quickshell/configs/"

    property int panelMargin: 10
    property int itemMargin: 10
}
