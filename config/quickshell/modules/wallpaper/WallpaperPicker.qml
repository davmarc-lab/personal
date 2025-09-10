pragma ComponentBehavior: Bound
import Quickshell

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.common
import qs.services
import qs.widgets

WPickerPopup {
    id: root

    open: Global.enableWPSelector
    onOpenChanged: {
        Global.enableWPSelector = this.open;
    }

    item: ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.preferredWidth: parent.width * 0.7
            Layout.fillHeight: true

            // Layout.maximumWidth: items.width
            Layout.alignment: Qt.AlignHCenter

            ScrollView {
                id: control
                anchors.fill: parent
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                ScrollBar.vertical: ScrollBar {
                    parent: control
                    x: control.width + width
                    y: control.topPadding
                    height: control.availableHeight
                    active: control.ScrollBar.horizontal.active
                }

                GridLayout {
                    id: items

                    anchors.fill: parent

                    rowSpacing: 50
                    columnSpacing: 50

                    columns: 4

                    Repeater {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        model: SWallpaper.getDetected(true)

                        delegate: ThumbImage {
                            id: wp
                            required property int index
                            required property string modelData

                            imgIdx: index
                            path: modelData

                            onImageClicked: elem => {
                                SWallpaper.setCurrentByIndex(elem);
                            }
                        }
                    }
                }
            }
        }
    }
}
