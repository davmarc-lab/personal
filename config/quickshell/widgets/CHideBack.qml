import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
import qs.widgets

Pane {
    id: root

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay

    property string bgColor: Theme.colorSurface
    property real opacity: 0.5

    color: "transparent"

    implicitWidth: screen.width
    implicitHeight: screen.height

    CRectangle {
        anchors.fill: parent
        opacity: root.opacity
        color: root.bgColor
    }
}
