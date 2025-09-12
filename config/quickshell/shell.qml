//@ pragma UseQApplication

import Quickshell

import qs.common
import qs.modules
import qs.modules.settings
import qs.modules.dock
import qs.modules.wallpaper
import qs.modules.powermenu

// (=^.^=)

ShellRoot {
    id: root

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
