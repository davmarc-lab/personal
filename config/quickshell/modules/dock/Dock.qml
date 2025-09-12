pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

PopupPane {
    id: content

    implicitWidth: screen.width
    implicitHeight: screen.height

    color: "transparent"

    property bool mouseDown: false
    onMouseDownChanged: {
        if (mouseDown && (!hover.hovered && !fooHover.res)) {
            Global.enableDock = false;
        }
    }

    anchors {
        top: true
    }

    MouseArea {
        id: mouse
        anchors.fill: parent

        propagateComposedEvents: true

        onPressedChanged: {
            content.mouseDown = this.pressed;
        }
    }

    CRectangle {
        id: masked
        anchors.horizontalCenter: parent.horizontalCenter

        width: Settings.dockWidth == 0 ? content.screen.width * Settings.dockWidthFactor : Settings.dockWidth
        height: 200

        HoverHandler {
            id: hover
        }

        CRectangle {
            id: main
            anchors.fill: parent
            height: 200
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter | Qt.AlignTop

            radius: Settings.dockRadius / 2

            RowLayout {
                anchors.fill: parent

                Item {
                    Layout.preferredWidth: parent.height * 0.2
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent

                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        BarFiller {}

                        CRButton {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            icon.source: Settings.iconsPath + "wallpaper.svg"
                            onClicked: {
                                Global.enableWPSelector = !Global.enableWPSelector;
                                Global.enableDock = false;
                            }
                        }

                        CRButton {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            icon.source: Settings.iconsPath + "settings.svg"
                            onClicked: {
                                Global.enableSettings = !Global.enableSettings;
                                Global.enableDock = false;
                            }
                        }

                        CRButton {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            icon.source: Settings.iconsPath + "power.svg"
                            onClicked: {
                                Global.enablePowerMenu = true;
                                Global.enableDock = false;
                            }
                        }
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            spacing: 20

                            Rectangle {
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 100

                                Image {
                                    id: name
                                    anchors.fill: parent
                                    source: Settings.iconsPath + "profile-icon.svg"
                                    sourceSize.width: parent.width
                                    sourceSize.height: parent.height
                                }
                            }

                            CTitle {
                                text: SUser.userName
                            }

                        }

                        CButton {
                            text: "Expand"

                            Layout.alignment: Qt.AlignHCenter

                            onClicked: {
                                foo.show = !foo.show;
                            }
                        }
                    }
                }
            }
        }
    }

    CRectangle {
        id: foo

        width: masked.width
        height: 400
        anchors.top: masked.bottom
        anchors.left: masked.left

        property bool show: false
        property int sizey: foo.show ? 400 : 0

        // Layout.margins: Settings.dockRadius / 2
        radius: Settings.dockRadius / 2

        opacity: show
        color: Theme.colorError

        HoverHandler {
            id: fooHover
            property bool res: this.hovered && foo.show
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }
}
