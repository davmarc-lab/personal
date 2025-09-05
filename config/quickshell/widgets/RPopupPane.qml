import QtQuick

import qs.common

PopupPane {
    id: root
    color: "transparent"

    property int radius: Settings.controlPanelRadius
    property string outlineColor: Theme.colorSurface

    function getRadius(): int {
        return this.radius;
    }

    function setRadius(radius: int): void {
        this.radius = radius;
    }

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.outlineColor
    }
}
