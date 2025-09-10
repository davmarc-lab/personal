pragma ComponentBehavior: Bound
import Quickshell

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.common
import qs.services
import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens

        RPopupPane {
            // FloatingPane {
            id: root

            // visible: false

            baseColor: "transparent"

            required property var modelData
            screen: modelData

            implicitWidth: screen.width
            implicitHeight: screen.height

            property bool mouseDown: false

            onMouseDownChanged: {
                console.log(this.mouseDown);
                if (root.mouseDown) {
                    // check mouse position if it's outside the popup close
                    // Global.enableWPSelector
                }
            }

            MouseArea {
                id: mouse

                anchors.fill: parent
                width: root.screen.width
                height: root.screen.height

                onPressedChanged: {
                    root.mouseDown = this.pressed;
                }
            }

            CRectangle {
                anchors.centerIn: parent
                width: root.screen.width * 0.4
                height: root.screen.height * 0.4

                ColumnLayout {
                    anchors.centerIn: parent

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
                                    model: SWallpaper.getDetected(true)

                                    delegate: Image {
                                        id: wp
                                        required property int index
                                        required property string modelData
                                        source: modelData

                                        Layout.preferredWidth: 280
                                        Layout.preferredHeight: 200

                                        // fillMode: Image.Pad
                                        // horizontalAlignment: Image.AlignHCenter
                                        // verticalAlignment: Image.AlignVCenter

                                        asynchronous: true

                                        MouseArea {
                                            anchors.fill: parent

                                            onClicked: {
                                                SWallpaper.setCurrentByIndex(wp.index);
                                            }
                                            onPressedChanged: {
                                                root.mouseDown = this.pressed;
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
    }
}
