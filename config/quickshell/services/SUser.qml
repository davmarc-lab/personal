pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root
    property bool run: false

    property string userName: ""

    function init(): void {
        this.run = true;
    }

    Process {
        id: userGet
        running: root.run
        command: ["sh", Settings.scriptPath + "user/prepare-user-info.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.userName = this.text.trim();
            }
        }
    }
}
