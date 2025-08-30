import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Quickshell.Services.Notifications
import Quickshell.Widgets
import Quickshell

import qs.widgets
import qs.services
import qs.common

FloatingWindow {
    id: root

    // anchors {
    //     bottom: true
    //     left: true
    // }

    CustomRButton {
        id: clear

        text: "Clear"
        anchors {
            top: parent.top
            right: parent.right
        }
    }

    Repeater {
        model: SNotification.notifications

        delegate: WrapperRectangle {
            id: notif
            required property Notification modelData

            ColumnLayout {
                Text {
                    id: aaa
                    color: "black"
                    text: "BC"
                    Component.onCompleted: function () {
                        console.log(notif.modelData.body);
                        console.log("AAA");
                    }
                }
            }
        }
    }

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
