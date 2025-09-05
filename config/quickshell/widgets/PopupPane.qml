import Quickshell.Wayland

Pane {
    WlrLayershell.layer: WlrLayer.Overlay

    exclusiveZone: 0

    property bool _visible: false

    function setVisible(flag: bool) {
        _visible = flag;
    }

    function toggle() {
        _visible = !_visible;
    }

    on_VisibleChanged: {
        this.visible = this._visible;
    }
}
