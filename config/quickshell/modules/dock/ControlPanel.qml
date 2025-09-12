import QtQuick

import qs.common
import qs.widgets

CRButton {
    id: ctl

    icon.source: Settings.iconsPath + "controls.svg"
    font.pointSize: Settings.fontSize

    HoverHandler {
        onHoveredChanged: {
            Global.ctlPanelButtonHover = this.hovered;
        }
    }

    Loader {
        active: Global.ctlPanelOpen

        sourceComponent: ControlPanelContent {
            id: controlPanel
            visible: Global.ctlPanelOpen
        }
    }
    onClicked: {
        Global.ctlPanelOpen = !Global.ctlPanelOpen;
    }
}
