import QtQuick
import Quickshell.Hyprland

BarText {
    text: Hyprland.activeToplevel?.title ?? ""
    color: Qt.rgba(240 / 255, 243 / 255, 248 / 255, 0.8)
    elide: Text.ElideRight
    width: Math.min(implicitWidth, 400)
}
