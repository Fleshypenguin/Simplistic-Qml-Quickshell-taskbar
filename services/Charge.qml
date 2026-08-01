pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton{
        id: root
        readonly property UPowerDevice displayDevice: UPower.displayDevice
        readonly property real percentage: displayDevice.percentage

        property int currentCharge: Math.round(percentage * 100)

}       