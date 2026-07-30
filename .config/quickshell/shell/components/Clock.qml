import QtQuick

BarText {
    id: clock

    property var now: new Date()
    text: now.toLocaleString(Qt.locale(), "HH:mm:ss dd.MM.yyyy")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.now = new Date()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.openUrlExternally("gnome-calendar")
    }
}
