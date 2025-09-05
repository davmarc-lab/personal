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

    // font
    property int fontSize: 10

    // notifications
    property int notifPanelWidth: 300
    property int notifPanelHeight: 600

    property int notifItemWidth: 300
    property int notifItemHeight: 80
    property int notifItemBorder: 10
}
