pragma ComponentBehavior: Bound

import QtQuick.Controls
import QtQuick.Layouts

import qs.common
import qs.widgets

ContentItem {
    id: root

    sizex: parent.width
    sizey: parent.height

    ScrollView {
        width: root.sizex
        height: root.sizey - (2 * Settings.panelMargin)

        x: (width - content.itemWidth) / 2
        y: Settings.panelMargin

        ContentSection {
            id: content
            title: "Theme Style"

            Layout.bottomMargin: 0
            Layout.topMargin: 0

            property real itemWidth: root.width * 0.7
            property real itemHeight: 30

            customWidth: itemWidth

            ContentItem {
                sizex: content.itemWidth
                sizey: content.itemHeight

                CSwitch {
                    id: themeSwitch
                    anchors.fill: parent

                    content: "Dark Mode"
                    checked: isDark

                    property bool isDark: Theme.themeStyle == "dark"

                    onCheckedChanged: {
                        Theme.themeStyle = this.checked ? "dark" : "light";
                    }
                }
            }

            LightThemeEdit {
                from: content
                visible: !themeSwitch.isDark
            }

            DarkThemeEdit {
                from: content
                visible: themeSwitch.isDark
            }

            // // FILLER
            // ContentItem {
            //     sizex: content.itemWidth
            //     sizey: content.itemHeight
            //
            //     Layout.fillHeight: true
            //
            //     Rectangle {
            //         anchors.fill: parent
            //         color: "transparent"
            //     }
            // }
        }
    }
}
