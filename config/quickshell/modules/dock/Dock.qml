pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

Scope {
    id: root
    Variants {
        model: Quickshell.screens

        PopupPane {
            id: content

            required property var modelData
            screen: modelData

            anchors {
                top: true
            }

            implicitWidth: Settings.dockWidth == 0 ? screen.width * Settings.dockWidthFactor : Settings.dockWidth
            implicitHeight: back.implicitHeight
            color: "transparent"

            // radius: Settings.dockRadius

            mask: Region {
                item: back
            }

            CRectangle {
                id: back

                anchors.fill: parent

                implicitHeight: main.height + foo.sizey

                ColumnLayout {
                    anchors.fill: parent

                    CRectangle {
                        id: main
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        // Layout.margins: Settings.dockRadius / 2
                        radius: Settings.dockRadius / 2

                        CButton {
                            text: "Expand"

                            anchors.centerIn: parent
                            onClicked: {
                                foo.show = !foo.show;
                                console.log(main.height);
                                console.log(foo.height);
                                console.log(back.height);
                            }
                        }
                    }

                    CRectangle {
                        id: foo
                        Layout.fillWidth: true
                        Layout.fillHeight: foo.show

                        property bool show: false
                        property int sizey: foo.show ? 400 : 0

                        // Layout.margins: Settings.dockRadius / 2
                        radius: Settings.dockRadius / 2

                        opacity: show
                        // visible: show
                        color: Theme.colorError

                        Behavior on opacity {
                            NumberAnimation {
                                duration: 200
                                // easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }
            }
        }
    }
}
