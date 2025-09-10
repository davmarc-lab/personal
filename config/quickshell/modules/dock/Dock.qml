pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

PopupPane {
    id: content

    implicitWidth: screen.width
    implicitHeight: screen.height

    color: "transparent"

    property bool mouseDown: false
    onMouseDownChanged: {
        if (mouseDown && (!hover.hovered && !fooHover.res)) {
            Global.enableDock = false;
        }
    }

    anchors {
        top: true
    }

    MouseArea {
        id: mouse
        anchors.fill: parent

        onPressedChanged: {
            content.mouseDown = this.pressed;
        }
    }

    CRectangle {
        id: masked
        anchors.horizontalCenter: parent.horizontalCenter

        width: Settings.dockWidth == 0 ? content.screen.width * Settings.dockWidthFactor : Settings.dockWidth
        height: 200

        HoverHandler {
            id: hover
        }

        ColumnLayout {
            anchors.fill: parent

            CRectangle {
                id: main
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter | Qt.AlignTop

                radius: Settings.dockRadius / 2

                ColumnLayout {
                    anchors.fill: parent

                    CRButton {
                        text: "Wallpaper"
                        Layout.alignment: Qt.AlignHCenter

                        onClicked: {
                            Global.enableWPSelector = !Global.enableWPSelector;
                        }
                    }

                    CButton {
                        text: "Expand"

                        Layout.alignment: Qt.AlignHCenter

                        onClicked: {
                            foo.show = !foo.show;
                        }
                    }
                }
            }
        }
    }

    CRectangle {
        id: foo

        width: masked.width
        height: 400
        anchors.top: masked.bottom
        anchors.left: masked.left

        property bool show: false
        property int sizey: foo.show ? 400 : 0

        // Layout.margins: Settings.dockRadius / 2
        radius: Settings.dockRadius / 2

        opacity: show
        color: Theme.colorError

        HoverHandler {
            id: fooHover
            property bool res: this.hovered && foo.show
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }
}
