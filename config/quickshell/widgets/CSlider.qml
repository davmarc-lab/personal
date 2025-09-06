import QtQuick
import QtQuick.Controls

Slider {
    id: root

    // default value
    value: 0.5

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 4
        width: root.availableWidth
        height: implicitHeight
        radius: 2
        color: "white"

        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            color: "black"
            radius: 2
        }
    }

    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: 26
        implicitHeight: 26
        radius: 13
        color: root.pressed ? "#f0f0f0" : "#f6f6f6"
        border.color: "red"
    }
}
