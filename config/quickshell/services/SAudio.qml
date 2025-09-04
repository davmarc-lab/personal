pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

import QtQuick

Singleton {
    id: root

    property bool init: false

    function getSourceDescription() {
        return Pipewire.defaultAudioSource.description;
    }
}
