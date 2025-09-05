import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.common

RPopupPane {
    id: controlSettings

    property string customIcon: "󰖩"
    property int gap: 2

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
            Layout.maximumHeight: 100
            Layout.preferredHeight: 100
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
                }

                CButton {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Disturb"
                }
            }
        }
    }
}
