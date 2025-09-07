import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick

import qs.common

MouseArea {
    id: root

    required property SystemTrayItem item
    readonly property var bar: root.QsWindow.window

    implicitWidth: 24
    implicitHeight: 24

    hoverEnabled: true
    enabled: true
    visible: true

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onClicked: event => {
        if (event.button == Qt.LeftButton) {
            item.activate();
        } else if (event.button == Qt.RightButton) {
            if (item.hasMenu) {
                // Until QsMenuAnchor is not ok use this
                // menu.open();
                item.display(bar, root.x, root.y - Settings.panelMargin);
            }
        }
        event.accepted = true;
    }

    IconImage {
        source: root.item.icon
        implicitSize: 24
    }
}
