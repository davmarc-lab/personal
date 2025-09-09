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

    x: parent.x

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
                menu.open();
                // item.display(bar, root.x, root.y);
            }
        }
        event.accepted = true;
    }

    IconImage {
        source: root.item.icon
        implicitSize: 24
    }

    QsMenuAnchor {
        id: menu
        anchor.window: root.bar

        menu: root.item.menu
        anchor.rect.x: root.x
        anchor.rect.y: root.y + root.bar.height
        anchor.rect.height: root.height
        anchor.rect.width: root.width
        anchor.edges: (Edges.Top | Edges.Right)
    }
}
