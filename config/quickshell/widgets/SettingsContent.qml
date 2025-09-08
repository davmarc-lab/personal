import QtQuick.Layouts

ColumnLayout {
    id: root
    property real customWidth: 0
    anchors.fill: parent

    Layout.preferredWidth: customWidth ? customWidth : implicitWidth
}
