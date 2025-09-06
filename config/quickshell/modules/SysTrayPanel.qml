import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.widgets
import qs.common

Pane {
    id: root

    anchors {
        bottom: true
        right: true
        left: true
    }

    implicitHeight: 24

    margins {
        right: Settings.notifItemBorder
        top: 0
    }

    color: "white"

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Repeater {
            model: SystemTray.items

            delegate: CSysTrayItem {
                required property SystemTrayItem modelData
                item: modelData
            }
        }
    }
}
