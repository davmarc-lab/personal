import QtQuick
import QtQuick.Layouts

import Quickshell

import qs.widgets
import qs.services
import qs.common

PopupPane {
    id: root
    visible: false

    anchors {
        top: true
        right: true
    }

    margins {
        right: Settings.notifItemBorder
    }

    implicitWidth: Settings.notifPanelWidth
    implicitHeight: Settings.notifPanelHeight
    color: Theme.colorSurface

    ColumnLayout {
        anchors.fill: parent
        anchors.rightMargin: Settings.notifItemBorder
        anchors.leftMargin: Settings.notifItemBorder

        CRButton {
            id: clear

            Layout.alignment: Qt.AlignRight

            text: "Clear"

            onClicked: () => {
                // it works
                SNotification.clearAll();
            }
        }

        ListView {
            id: notifs
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: ScriptModel {
                id: notifModel
                values: [...SNotification.notifications]
            }

            spacing: Settings.notifItemBorder

            delegate: Rectangle {
                id: notif
                required property SNotification.Notif modelData

                color: Theme.colorSurfaceVariant

                implicitWidth: Settings.notifItemWidth - 2 * Settings.notifItemBorder
                implicitHeight: Settings.notifItemHeight
                Layout.alignment: Qt.AlignHCenter

                CText {
                    id: notifSum
                    color: Theme.colorOnSurfaceVariant
                    font.pointSize: Settings.notifSumFontSize
                    text: notif.modelData.summary
                    // used to print font.pointSize
                    // text: "<a href=\"http://qt-project.org\">Qt Project website</a>"
                    // onLinkHovered: {
                    //     console.log(notifSum.fontInfo.pointSize);
                    // }
                }
            }
        }
    }
}
