import QtQuick.Controls

import qs.widgets
import qs.common

Pane {
    // color: "white"
    anchors {
        bottom: true
        left: true
    }

    CustomRButton {
        id: wifiIcon

        property string customIcon: "󰖩 "

        property string networkName: ""

        text: `${customIcon}`

        anchors {
            left: parent.left
            top: parent.top
            leftMargin: Settings.itemMargin
            topMargin: Settings.itemMargin
        }
    }
}
