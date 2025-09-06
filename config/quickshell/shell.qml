import Quickshell

import qs.modules

ShellRoot {
    id: root

    property bool enableBar: true
    property bool enableNotification: true

    LazyLoader { active: root.enableBar; component: SimpleBar {} }
    LazyLoader { active: root.enableNotification; component: NotificationPanel {} }
}
