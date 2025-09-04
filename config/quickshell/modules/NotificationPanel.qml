import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Quickshell.Services.Notifications
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell

import qs.widgets
import qs.services
import qs.common

PanelWindow {
    id: root

    anchors {
        top: true
        right: true
    }

    WlrLayershell.layer: WlrLayer.Overlay
    exclusiveZone: 0

    ListView {
        id: notifs
        anchors.fill: parent
        model: ScriptModel {
            id: notifModel
            values: [...SNotification.notifications]
        }

        spacing: 10

        delegate: Item {
            id: notif

            required property SNotification.Notif modelData

            Text {
                id: notifSum
                color: "white"
                text: notif.modelData.summary
            }
        }
    }
    CustomRButton {
        id: clear

        anchors.right: parent.right

        text: "Clear"

        onClicked: () => {
            // it works
            SNotification.clearAll();
        }
    }

    // Repeater {
    //     model: SNotification.notifications
    //
    //     delegate: WrapperRectangle {
    //         id: notif
    //         required property Notification modelData
    //
    //         ColumnLayout {
    //             Text {
    //                 id: aaa
    //                 color: "black"
    //                 text: "BC"
    //                 Component.onCompleted: function () {
    //                     console.log(notif.modelData.summary);
    //                     console.log("PRINT");
    //                 }
    //             }
    //         }
    //     }
    // }

    // ListView {
    //     anchors.fill: parent
    //     model: SNotification.notifications
    //     spacing: 5
    //     orientation: Qt.Vertical
    //
    //     delegate: WrapperRectangle {
    //         id: notif
    //         required property Notification modelData
    //
    //         ColumnLayout {
    //             Text {
    //                 id: aaa
    //                 color: "black"
    //                 text: "A"
    //             }
    //         }
    //     }
    // }
}
