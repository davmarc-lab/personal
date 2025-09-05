pragma ComponentBehavior: Bound

import QtQuick.Controls

import qs.common

Button {
    id: btn

    property var bgColor: Theme.colorPrimary
    property var bgColorHovered: Theme.colorPrimaryHover
    property var fgColor: Theme.colorOnPrimary
    property var fgColorHovered: Theme.colorOnPrimary

    anchors {
        leftMargin: Settings.itemMargin
        topMargin: Settings.itemMargin
    }

    palette.buttonText: this.hovered ? this.fgColorHovered : this.fgColor
    palette.button: bgColor
    palette.window: Theme.colorOutline
}
