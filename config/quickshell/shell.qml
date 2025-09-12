//@ pragma UseQApplication

import Quickshell

import QtQuick

import qs.common
import qs.modules
import qs.modules.settings
import qs.modules.dock
import qs.modules.wallpaper
import qs.modules.powermenu
import qs.services

// (=^.^=)

ShellRoot {
    id: root

    Component.onCompleted: {
        SUser.init();
    }

    LazyLoader {
        active: Global.enableBar
        component: SimpleBar {}
    }
    LazyLoader {
        active: Global.enableNotification
        component: NotificationPanel {}
    }
    LazyLoader {
        active: Global.enableSysTray
        component: SystemTray {}
    }

    LazyLoader {
        active: Global.enableSettings
        component: SettingsWindow {}
    }

    LazyLoader {
        active: Global.enableDock
        component: Dock {}
    }

    LazyLoader {
        active: Global.enableWPSelector
        component: WallpaperPicker {}
    }

    LazyLoader {
        active: Global.enablePowerMenu
        component: PowerMenu {}
    }

    LazyLoader {
        active: Global.enableWallpaper
        component: Wallpaper {}
    }

    LazyLoader {
        active: Global.enableFoo
        component: Foo {}
    }
}
