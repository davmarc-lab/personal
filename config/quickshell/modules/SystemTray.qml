pragma ComponentBehavior: Bound

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

    readonly property var bar: QsWindow.window

    Repeater {
        model: root.filteredItems

        delegate: MouseArea {
            id: sysItem
            required property SystemTrayItem modelData

            implicitWidth: 24
            implicitHeight: 24

            x: parent.x

            hoverEnabled: true
            enabled: true
            visible: true

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: event => {
                if (event.button == Qt.LeftButton) {
                    modelData.activate();
                } else if (event.button == Qt.RightButton) {
                    if (modelData.hasMenu) {
                        // Until QsMenuAnchor is not ok use this
                        menu.open();
                        // item.display(bar, root.x, root.y);
                    }
                }
                event.accepted = true;
            }

            IconImage {
                source: sysItem.modelData.icon
                implicitSize: 24

                HoverHandler {
                    onHoveredChanged: {
                        console.log(sysItem.x);
                    }
                }
            }

            QsMenuAnchor {
                id: menu
                anchor.window: root.bar

                menu: sysItem.modelData.menu
                // anchor.rect.x: root.bar.x
                // anchor.rect.y: root.bar.y
                // anchor.rect.height: sysItem.height
                // anchor.rect.width: sysItem.width
                // anchor.edges: Edges.Right
            }
        }
    }
}
