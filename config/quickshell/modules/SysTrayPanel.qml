import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.widgets
import qs.common

Pane {
    id: root

    readonly property var items: SystemTray.items
    readonly property var filteredItems: items.values.filter(i => i.status != 0)

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

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Repeater {
            model: root.filteredItems

            delegate: CSysTrayItem {
                required property SystemTrayItem modelData
                item: modelData
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
