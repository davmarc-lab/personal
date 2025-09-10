import QtQuick

import qs.services

ListModel {
    Repeater {
        model: SWallpaper.getDetected(true)

        delegate: ListElement {
            ListElement {
                path: model
            }
        }
    }
}
