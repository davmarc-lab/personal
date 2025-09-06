import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.widgets
import qs.common

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        Pane {
            id: mainBar
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 32

            ListView {
                id: dsk
                anchors.fill: parent
                model: Hyprland.workspaces
                spacing: 2
                orientation: Qt.Horizontal

                delegate: WrapperRectangle {
                    id: wsDelegate
                    required property HyprlandWorkspace modelData
                    color: Theme.colorSurface
                    ColumnLayout {
                        layoutDirection: Qt.RightToLeft
                        CRButton {
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

            ClockWidget {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                color: "white"
            }

            // controlPanel or Dock
            CRButton {
                id: ctl
                anchors.right: parent.right

                HoverHandler {
                    onHoveredChanged: {
                        Global.ctlPanelButtonHover = this.hovered;
                    }
                }

                Loader {
                    active: Global.ctlPanelOpen

                    sourceComponent: ControlPanel {
                        id: controlPanel
                        visible: Global.ctlPanelOpen
                    }
                }
                onClicked: {
                    Global.ctlPanelOpen = !Global.ctlPanelOpen;
                }
            }
        }
    }
}
