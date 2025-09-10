pragma ComponentBehavior: Bound

import Quickshell

import QtQuick

import qs.widgets

RPopupPane {
    id: root
    required property Component item
    property bool mouseDown: false
    property bool hovered: false
    property bool open: false

    onMouseDownChanged: {
        if (this.mouseDown && !hovered) {
            this.open = false;
        }
    }

    baseColor: "transparent"

    implicitWidth: screen.width
    implicitHeight: screen.height

    MouseArea {
        id: mouse

        propagateComposedEvents: true

        anchors.fill: parent
        width: root.screen.width
        height: root.screen.height

        onPressedChanged: {
            root.mouseDown = this.pressed;
        }
    }

    CRectangle {
        anchors.centerIn: parent
        width: root.screen.width * 0.4
        height: root.screen.height * 0.4

        HoverHandler {
            id: contentArea
            onHoveredChanged: {
                root.hovered = hovered;
            }
        }

        Loader {
            id: main
            anchors.fill: parent
            sourceComponent: root.item
        }
    }
}
