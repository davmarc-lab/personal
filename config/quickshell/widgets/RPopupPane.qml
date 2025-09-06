import QtQuick

import qs.common

PopupPane {
    id: root
    color: "transparent"

    property int radius: Settings.controlPanelRadius
    property string baseColor: Theme.colorSurface

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.baseColor
    }
}
