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

    _visible: this.visible

    anchors {
        top: true
        right: true
    }

    margins {
        top: -Settings.panelMargin + this.gap
    }

    implicitWidth: Settings.controlPanelWidth
    implicitHeight: Settings.controlPanelHeight

    // not visible without margins
    outlineColor: Theme.colorError

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.controlPanelMargin

        ColumnLayout {
            id: main
            Layout.maximumHeight: 150
            Layout.preferredHeight: 150
            Layout.alignment: Qt.AlignTop

            RowLayout {
                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Wifi"
                }

                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "BT"
                }
            }

            RowLayout {
                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Volume???"

                    onClicked: {
                        volumeBar.visible = !volumeBar.visible;
                        main.Layout.maximumHeight += volumeBar.visible ? 50 : -50;
                        main.Layout.preferredHeight += volumeBar.visible ? 50 : -50;
                    }
                }

                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Disturb"
                }
            }

            RowLayout {
                id: volumeBar
                visible: true
                Layout.preferredHeight: 50
                // Layout.preferredHeight: 50 - 1.5 * Settings.controlPanelMargin

                Slider {
                    value: SAudio.getVolume() / 100

                    onMoved: {
                        SAudio.setVolume(this.value);
                    }
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: true

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                // Layout.preferredHeight: 30
                // Layout.maximumHeight: 300
                color: "red"
            }
        }
    }
}
