//@ pragma UseQApplication

import Quickshell

import qs.modules
import qs.modules.settings

// (=^.^=)

ShellRoot {
    id: root

    property bool enableBar: false
    property bool enableNotification: true
    property bool enableSysTray: false

    property bool enableSettings: true
    property bool enableFoo: false

    LazyLoader { active: root.enableBar; component: SimpleBar {} }
    LazyLoader { active: root.enableNotification; component: NotificationPanel {} }
    LazyLoader { active: root.enableSysTray; component: SysTrayPanel {} }

    LazyLoader { active: root.enableSettings; component: SettingsWindow{}}

    // LazyLoader { active: root.enableFoo; component: Foo {}}
}
