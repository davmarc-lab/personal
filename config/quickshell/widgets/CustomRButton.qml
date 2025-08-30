pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import qs.common

RoundButton {
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

    background: Rectangle {
        id: back
        radius: parent.width / 2
        color: btn.hovered ? btn.bgColorHovered : btn.bgColor
    }
}
