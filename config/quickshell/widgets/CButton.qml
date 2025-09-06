pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import qs.common

Button {
    id: root

    property string bgColor: Theme.colorPrimary
    property string bgColorHovered: Theme.colorPrimaryHover
    property string fgColor: Theme.colorOnPrimary
    property string fgColorHovered: Theme.colorOnPrimary

    property string colorClicked: Theme.colorSecondary
    property string outlineColor: Theme.colorOutline
    property int outlineSize: Settings.buttonOutlineSize

    property int borderRadius: Settings.buttonSoftRadius

    anchors {
        leftMargin: Settings.itemMargin
        topMargin: Settings.itemMargin
    }

    background: Rectangle {
        id: back
        implicitWidth: 100
        implicitHeight: 40

        color: root.hovered ? (root.pressed ? root.colorClicked : root.bgColorHovered) : root.bgColor
        border.color: root.outlineColor
        border.width: root.outlineSize
        radius: root.borderRadius
    }

    palette.buttonText: this.hovered ? this.fgColorHovered : this.fgColor
}
