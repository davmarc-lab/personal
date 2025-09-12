import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

Pane {
    id: root

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    // WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    property bool mouseDown: false
    property bool hovered: false

    onMouseDownChanged: {
        if (this.mouseDown && !hovered) {
            Global.enablePowerMenu = false;
        }
    }

    color: "transparent"

    implicitWidth: screen.width
    implicitHeight: screen.height

    MouseArea {
        id: mouse

        propagateComposedEvents: true

        width: root.screen.width
        height: root.screen.height

        onPressedChanged: {
            root.mouseDown = this.pressed;
        }
    }

    CHideBack {
        bgColor: "black"
    }

    CRectangle {
        anchors.centerIn: parent
        width: root.screen.width * 0.6
        height: root.screen.height * 0.6

        PowerMenuContent {
            PowerMenuButton {
                command: "loginctl lock-session"
                keybind: Qt.Key_K
                text: "Lock"
                icon: "lock"
            }

            PowerMenuButton {
                command: "loginctl terminate-user $USER"
                keybind: Qt.Key_E
                text: "Logout"
                icon: "logout"
            }

            PowerMenuButton {
                command: "systemctl suspend"
                keybind: Qt.Key_U
                text: "Suspend"
                icon: "suspend"
            }

            PowerMenuButton {
                command: "systemctl hibernate"
                keybind: Qt.Key_H
                text: "Hibernate"
                icon: "hibernate"
            }

            PowerMenuButton {
                command: "systemctl poweroff"
                keybind: Qt.Key_K
                text: "Shutdown"
                icon: "shutdown"
            }

            PowerMenuButton {
                command: "systemctl reboot"
                keybind: Qt.Key_R
                text: "Reboot"
                icon: "reboot"
            }
        }

        HoverHandler {
            id: contentArea
            onHoveredChanged: {
                root.hovered = hovered;
            }
        }
    }
}
