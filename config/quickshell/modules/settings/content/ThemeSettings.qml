import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.common
import qs.widgets

ColumnLayout {
    id: root
    anchors.fill: parent

    Rectangle {
        id: main
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.maximumWidth: root.width * 0.7

        color: "transparent"

        ScrollView {
            id: scroll
            anchors.fill: parent

            ScrollBar.vertical: ScrollBar {
                parent: scroll
                x: scroll.width + width
                y: scroll.topPadding + Settings.panelMargin
                height: scroll.availableHeight - Settings.panelMargin
            }

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.alignment: Qt.AlignTop

                    Layout.topMargin: Settings.panelMargin

                    CSwitch {
                        content: "Dark Mode"
                        checked: status

                        property bool status: Theme.themeStyle == "dark"

                        onCheckedChanged: {
                            Theme.themeStyle = this.checked ? "dark" : "light";
                        }
                    }
                    color: "transparent"
                }

                Repeater {
                    model: 30
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 30

                        Layout.topMargin: Settings.panelMargin

                        CSwitch {
                            content: "Dio è un porco??"
                            checked: true
                        }
                        color: "transparent"
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignBottom
            color: "transparent"
        }
    }
}
