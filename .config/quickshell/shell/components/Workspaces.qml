import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    spacing: 14

    Repeater {
        model: Hyprland.workspaces

        BarText {
            required property var modelData
            visible: modelData.id > 0
            text: modelData.name
            color: modelData.focused ? Qt.rgba(51 / 255, 204 / 255, 255 / 255, 0.8) : Qt.rgba(255 / 255, 255 / 255, 255 / 255, 0.67)
            font.bold: modelData.focused
            font.pixelSize: 14

            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }
        }
    }
}
