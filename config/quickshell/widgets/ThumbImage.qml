import Quickshell

import QtQuick

import qs.common

Rectangle {
    id: root
    required property int imgIdx
    required property string path

    property int sizex: Settings.thumbWidth
    property int sizey: Settings.thumbHeight

    width: sizex
    height: sizey

    signal imageClicked(int index)

    Image {
        id: img
        anchors.fill: parent

        source: root.path

        asynchronous: true

        MouseArea {
            anchors.fill: parent

            onClicked: root.imageClicked(root.imgIdx)
        }
    }
}
