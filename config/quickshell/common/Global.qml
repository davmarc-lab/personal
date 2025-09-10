pragma Singleton

import Quickshell

Singleton {
    id: root

    property bool enableBar: true
    property bool enableNotification: true
    property bool enableSysTray: false

    property bool enableSettings: false
    property bool enableFoo: false
    property bool enableWallpaper: true
    property bool enableWPSelector: false

    property bool enableDock: false

    // control panel
    property bool ctlPanelOpen: false
    property bool ctlPanelButtonHover: false
}
