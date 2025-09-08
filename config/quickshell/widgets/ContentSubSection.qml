import QtQuick.Layouts

ColumnLayout {
    id: root

    property string title: ""
    property string icon: ""
    property real customWidth: parent.width

    Layout.preferredWidth: customWidth

    ContentItem {
        sizex: root.customWidth
        sizey: title.height

        CTitle {
            id: title
            Layout.alignment: Qt.AlignTop
            text: root.icon + root.title
            subtitle: true
        }
    }
}
