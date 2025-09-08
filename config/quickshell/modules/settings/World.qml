import QtQuick
import QtQuick.Layouts

import qs.common

ColumnLayout {
    id: root

    Rectangle {
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.maximumWidth: root.width * 0.7

        Layout.topMargin: Settings.panelMargin
        Layout.bottomMargin: Layout.topMargin
        Layout.leftMargin: Settings.panelMargin
        Layout.rightMargin: Layout.leftMargin

        color: "transparent"

        ColumnLayout {
            Text {
                text: "World"
            }
        }
    }
}
