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

    function setCurrent(name: string): void {
        this.current = name;
    }

    function getDetected() {
        return data.names;
    }

    function contains(name: string): bool {
        for (var s in data.names) {
            if (s == name) {
                return true;
            }
        }
        return false;
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
                    for (var s of (this.text.split("\n"))) {
                        if (s.length) {
                            data.names.push(s);
                        }
                    }
                }
            }
        }
    }
}
