import Quickshell

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.widgets
import qs.common
import qs.services

RPopupPane {
    id: controlSettings

    property string customIcon: "󰖩"
    property int gap: 2

    anchors {
        top: true
        right: true
    }

    margins {
        top: Settings.topBarMargin
    }

    implicitWidth: Settings.controlPanelWidth
    implicitHeight: Settings.controlPanelHeight

    HoverHandler {
        id: hover

        // Used to close panel when cursor goes outside
        // onHoveredChanged: {
        //     Global.ctlPanelOpen = hovered;
        // }
    }

    Timer {
        interval: Settings.controlPanelOutTime * 1000
        running: !hover.hovered
        repeat: true
        onTriggered: {
            Global.ctlPanelOpen = hover.hovered || Global.ctlPanelButtonHover;
        }
    }

    baseColor: Theme.colorSurface

    RowLayout {
        anchors.fill: parent
        anchors.margins: Settings.controlPanelMargin

        ColumnLayout {
            id: main
            Layout.alignment: Qt.AlignTop

            RowLayout {
                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: ""
                }

                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: " "
                }
            }

            RowLayout {
                CButton {
                    id: volume
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    colorClicked: bgColorHovered

                    RowLayout {
                        id: volumeBar
                        anchors.fill: parent
                        anchors.margins: Settings.controlPanelMargin

                        visible: volume.hovered

                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignVCenter

                        Text {
                            text: SAudio.getVolume()
                        }

                        CSlider {
                            Layout.fillWidth: true

                            value: SAudio.getVolume() / 100

                            onMoved: {
                                SAudio.setVolume(this.value);
                            }
                        }
                    }

                    text: volumeBar.visible ? undefined : ""
                }

                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: ""
                }
            }
        }
    }
}
