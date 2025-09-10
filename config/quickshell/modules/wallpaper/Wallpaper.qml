import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.services

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            required property var modelData
            screen: modelData

            exclusionMode: ExclusionMode.Ignore

            WlrLayershell.layer: WlrLayer.Background
            aboveWindows: false
            color: "transparent"

            implicitWidth: screen.width
            implicitHeight: screen.height

            Image {
                id: name
                anchors.fill: parent
                source: SWallpaper.getCurrent()
            }
        }
    }
}
