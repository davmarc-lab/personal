import QtQuick.Layouts

import qs.common
import qs.widgets

ContentSubSection {
    id: root
    required property var from

    title: "Light Theme"
    Layout.alignment: Qt.AlignHCenter
    Layout.preferredWidth: from.itemWidth

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Primary"
            color: Theme.lightPrimary

            onColorChanged: {
                Theme.lightPrimary = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Primary Hover"
            color: Theme.lightPrimaryHover

            onColorChanged: {
                Theme.lightPrimaryHover = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "On Primary"
            color: Theme.lightOnPrimary

            onColorChanged: {
                Theme.lightOnPrimary = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Secondary"
            color: Theme.lightSecondary

            onColorChanged: {
                Theme.lightSecondary = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Secondary Hover"
            color: Theme.lightSecondaryHover

            onColorChanged: {
                Theme.lightSecondaryHover = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "On Secondary"
            color: Theme.lightOnSecondary

            onColorChanged: {
                Theme.lightOnSecondary = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Error"
            color: Theme.lightError

            onColorChanged: {
                Theme.lightError = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "On Error"
            color: Theme.lightOnError

            onColorChanged: {
                Theme.lightOnError = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Surface"
            color: Theme.lightSurface

            onColorChanged: {
                Theme.lightSurface = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "On Surface"
            color: Theme.lightOnSurface

            onColorChanged: {
                Theme.lightOnSurface = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Surface Varian"
            color: Theme.lightSurfaceVariant

            onColorChanged: {
                Theme.lightSurfaceVariant = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "On Surface Variant"
            color: Theme.lightOnSurfaceVariant

            onColorChanged: {
                Theme.lightOnSurfaceVariant = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Outline"
            color: Theme.lightOutline

            onColorChanged: {
                Theme.lightOutline = this.color;
            }
        }
    }

    ContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        ColorEdit {
            anchors.fill: parent

            text: "Shadow"
            color: Theme.lightShadow

            onColorChanged: {
                Theme.lightShadow = this.color;
            }
        }
    }
}
