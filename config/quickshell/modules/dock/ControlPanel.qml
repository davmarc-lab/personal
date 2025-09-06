import QtQuick

import qs.common
import qs.widgets

CRButton {
    id: ctl

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
