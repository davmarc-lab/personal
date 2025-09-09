import QtQuick
import QtQuick.Layouts

import qs.widgets

PopupPane {

    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            id: rect
            Layout.preferredWidth: 100
            height: 100
            color: "red"

            Behavior on Layout.preferredWidth {
                NumberAnimation {
                    duration: 1000
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Layout.preferredWidth = 50
            }
        }
    }
}
