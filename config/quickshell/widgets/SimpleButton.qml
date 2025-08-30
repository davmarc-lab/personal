pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import qs.common

Button {
    id: btn

    property var bgColor: Theme.colorPrimary
    property var bgColorHovered: Theme.colorPrimaryHover
    property var fgColor: Theme.colorSurface
    property var fgColorHovered: Theme.colorSurface

    anchors {
        leftMargin: Settings.itemMargin
        topMargin: Settings.itemMargin
    }

    palette.buttonText: this.hovered ? this.fgColorHovered : this.fgColor

    background: Rectangle {
        id: back
        color: btn.hovered ? btn.bgColorHovered : btn.bgColor
    }
}
