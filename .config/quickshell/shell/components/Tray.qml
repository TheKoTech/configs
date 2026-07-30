import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray

RowLayout {
    id: tray
    required property QtObject menuParent
    spacing: 12

    Repeater {
        model: SystemTray.items

        IconImage {
            required property var modelData
            source: modelData.icon
            implicitSize: 16

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                    } else {
                        const pos = mapToItem(tray.menuParent.contentItem, mouse.x, mouse.y);
                        modelData.display(tray.menuParent, pos.x, pos.y);
                    }
                }
            }
        }
    }
}
