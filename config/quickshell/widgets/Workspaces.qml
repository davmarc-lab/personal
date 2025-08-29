import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.modules

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        FloatingWindow {
            required property var modelData
            screen: modelData

            ListView {
                anchors.fill: parent
                model: Hyprland.workspaces
                spacing: 5
                orientation: Qt.Horizontal

                delegate: WrapperRectangle {
                    id: wsDelegate
                    required property HyprlandWorkspace modelData

                    ColumnLayout {
                        layoutDirection: Qt.RightToLeft
                        RoundButton {
                            background: Rectangle {
                                id: circle
                                radius: 14
                                color: Theme.bgColor
                            }

                            palette.buttonText: hover.hovered ? Theme.fgColor : "black"

                            HoverHandler {
                                id: hover
                            }

                            text: wsDelegate.modelData.id

                            onClicked: wsDelegate.modelData.activate()
                        }
                    }
                }
            }
        }
    }
}

// PanelWindow {
//     required property var modelData
//     screen: modelData
//
//     anchors {
//         top: true
//         left: true
//         right: true
//     }
//     ListView {
//         anchors.fill: parent
//         model: Hyprland.workspaces
//         spacing: 5
//
//         delegate: WrapperRectangle {
//             id: wsDelegate
//             required property HyprlandWorkspace modelData
//             color: "red"
//
//             ColumnLayout {
//                 Text {
//                     text: wsDelegate.modelData.id
//                 }
//             }
//         }
//     }
// }
