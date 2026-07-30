import Quickshell.Services.UPower

BarText {
    visible: UPower.displayDevice.isLaptopBattery
    text: "  " + Math.round(UPower.displayDevice.percentage * 100) + "%"
    color: Qt.rgba(0 / 255, 241 / 255, 169 / 255, 0.933)
}
