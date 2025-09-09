pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Hyprland

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.widgets
import qs.modules.dock
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

            margins {
                top: Settings.topBarMargin
                left: Settings.topBarMargin
                right: Settings.topBarMargin
                bottom: 0
            }

            implicitHeight: 38

            RowLayout {
                id: barZones
                anchors.fill: parent
                Layout.maximumWidth: mainBar.width

                BarFiller {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                    RowLayout {
                        id: left
                        anchors.fill: parent
                        Repeater {
                            id: dsk
                            model: Hyprland.workspaces.values.filter(elem => elem.id >= 0)

                            delegate: CRButton {
                                id: wsDelegate
                                Layout.alignment: Qt.AlignVCenter

                                required property HyprlandWorkspace modelData

                                palette.buttonText: hover.hovered ? Theme.colorSecondary : Theme.colorOnPrimary

                                HoverHandler {
                                    id: hover
                                }

                                text: wsDelegate.modelData.id

                                onClicked: {
                                    wsDelegate.modelData.activate();
                                }
                            }
                        }

                        BarFiller {}
                    }
                }

                BarFiller {
                    Layout.alignment: Qt.AlignHCenter

                    RowLayout {
                        id: center
                        anchors.fill: parent

                        BarFiller {}

                        ClockWidget {
                            MouseArea {
                                anchors.fill: parent

                                onClicked: {
                                    Global.enableDock = !Global.enableDock;
                                }
                            }
                        }

                        BarFiller {}
                    }
                }

                BarFiller {
                    Layout.alignment: Qt.AlignRight

                    RowLayout {
                        id: right
                        anchors.fill: parent

                        BarFiller {}

                        SystemTray {
                            id: sysTray
                            // Layout.alignment: Qt.AlignRight
                        }

                        ControlPanel {
                            id: control
                            Layout.alignment: Qt.AlignRight
                        }
                    }
                }
            }

            // controlPanel or Dock
        }
    }
}
