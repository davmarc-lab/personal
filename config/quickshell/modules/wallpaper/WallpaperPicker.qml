import Quickshell

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.services
import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens

        // RPopupPane {
        FloatingPane {
            id: root

            // visible: false

            required property var modelData
            screen: modelData

            implicitWidth: screen.width * 0.4
            implicitHeight: screen.height * 0.4

            ColumnLayout {
                anchors.fill: parent

                Item {
                    Layout.preferredWidth: parent.width * 0.7
                    Layout.fillHeight: true

                    Layout.maximumWidth: items.width
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

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
                                Layout.alignment: Qt.AlignHCenter
                                model: SWallpaper.getDetected()

                                delegate: Image {
                                    id: wp
                                    required property string modelData
                                    source: SWallpaper.path + modelData
                                    Layout.preferredWidth: 220
                                    Layout.preferredHeight: 150

                                    MouseArea {
                                        anchors.fill: parent

                                        onClicked: { SWallpaper.setCurrent(wp.modelData); }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
