//@ pragma UseQApplication
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "./components"

ShellRoot {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 38
            color: "#80000000"

            Workspaces {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 8
                }
            }

            WindowTitle {
                anchors.centerIn: parent
            }

            RowLayout {
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 8
                }
                spacing: 12

                Tray {
                    menuParent: bar
                }
                Volume {}
                Battery {}
                Clock {}
            }
        }
    }
}
