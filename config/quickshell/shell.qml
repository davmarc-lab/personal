//@ pragma UseQApplication

import Quickshell

import qs.modules
import qs.modules.settings

// (=^.^=)

ShellRoot {
    id: root

    property bool enableBar: true
    property bool enableNotification: true
    property bool enableSysTray: true

    property bool enableSettings: true

    LazyLoader { active: root.enableBar; component: SimpleBar {} }
    LazyLoader { active: root.enableNotification; component: NotificationPanel {} }
    LazyLoader { active: root.enableSysTray; component: SysTrayPanel {} }

    LazyLoader { active: root.enableSettings; component: SettingsWindow{}}
}
