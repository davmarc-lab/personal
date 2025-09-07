import QtQuick.Layouts

import qs.widgets

CButton {
    required property string entry
    property bool open: false

    Layout.alignment: Qt.AlignHCenter
    Layout.fillWidth: true

    text: entry

    onClicked: {
        open = !open;
    }
}
