import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.common

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

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
                                color: Theme.colorPrimary
                            }

                            palette.buttonText: hover.hovered ? Theme.colorSecondary : "black"

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
