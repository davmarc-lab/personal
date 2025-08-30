pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: theme

    property string themeStyle: "dark"

    readonly property string colorPrimary: themeStyle == "dark" ? themeData.dark.mPrimary : themeData.light.mPrimary
    readonly property string colorOnPrimary: themeStyle == "dark" ? themeData.dark.mOnPrimary : themeData.light.mOnPrimary

    readonly property string colorSecondary: themeStyle == "dark" ? themeData.dark.mSecondary : themeData.light.mSecondary
    readonly property string colorOnSecondary: themeStyle == "dark" ? themeData.dark.mOnSecondary : themeData.light.mOnSecondary

    readonly property string colorError: themeStyle == "dark" ? themeData.dark.mError : themeData.light.mError
    readonly property string colorOnError: themeStyle == "dark" ? themeData.dark.mOnError : themeData.light.mOnError

    readonly property string colorSurface: themeStyle == "dark" ? themeData.dark.mSurface : themeData.light.mSurface
    readonly property string colorOnSurface: themeStyle == "dark" ? themeData.dark.mOnSurface : themeData.light.mOnSurface

    readonly property string colorSurfaceVariant: themeStyle == "dark" ? themeData.dark.mSurfaceVariant : themeData.light.mSurfaceVariant
    readonly property string colorOnSurfaceVariant: themeStyle == "dark" ? themeData.dark.mOnSurfaceVariant : themeData.light.mOnSurfaceVariant

    readonly property string colorOutline: themeStyle == "dark" ? themeData.dark.mOutline : themeData.light.mOutline
    readonly property string colorShadow: themeStyle == "dark" ? themeData.dark.mShadow : themeData.light.mShadow

    FileView {
        id: themeFile
        path: Settings.configsPath + "colorscheme.json"

        blockLoading: true
        watchChanges: true

        onFileChanged: reload()
    }
    readonly property var themeData: JSON.parse(themeFile.text())
}
