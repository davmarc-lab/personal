import qs.widgets
import qs.common

CustomRButton {
    id: controlSettings

    property string customIcon: "󰖩 "

    text: `${customIcon}`

    anchors.rightMargin: Settings.itemMargin
}
