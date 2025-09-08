import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.widgets
import qs.common

RowLayout {
    id: root
    readonly property var items: SystemTray.items
    readonly property var filteredItems: items.values.filter(i => i.status != 0)

    Repeater {
        model: root.filteredItems

        delegate: CSysTrayItem {
            required property SystemTrayItem modelData
            item: modelData
        }
    }
}
