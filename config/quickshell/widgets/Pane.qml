import Quickshell

import qs.common

PanelWindow {
    id: panel

    margins {
        left: Settings.panelMargin
        right: Settings.panelMargin
        top: Settings.panelMargin
        bottom: Settings.panelMargin
    }

    aboveWindows: true

    color: Theme.colorSurface
}
