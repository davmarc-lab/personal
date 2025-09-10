pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    property string path: Settings.wallpaperDir
    property string current: Settings.wallpaperFile

    function init(): void {
    // console.log("-- Init wallpaper service");
    }

    Item {
        Component.onCompleted: {
            if (Global.enableWallpaper)
                root.init();
        }
    }

    function getCurrent(): string {
        return path + current ?? "";
    }

    function setCurrentByIndex(index: int): void {
        if (index >= 0 && index < data.names.length)
            this.current = data.names[index];
    }

    function setCurrent(name: string): void {
        if (data.names.filter(s => s == (path + name)).length)
            this.current = path + name;
    }

    function getDetected(fullPath): bool {
        return fullPath ? data.names.map(s => root.path + s) : data.names;
    }

    Item {
        id: data

        property list<string> names: []

        Process {
            id: wpDetect
            running: Global.enableWallpaper
            command: ["ls", root.path]
            stdout: StdioCollector {
                onStreamFinished: {
                    wpDetect.running = false;
                    for (var s of this.text.split("\n")) {
                        if (s.length) {
                            data.names.push(s);
                        }
                    }
                }
            }
        }
    }
}
