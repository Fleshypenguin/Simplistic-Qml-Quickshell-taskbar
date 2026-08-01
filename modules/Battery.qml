import Quickshell
import QtQuick
import QtQml

import qs.services
import qs.conf

Rectangle {


        implicitHeight: text.implicitHeight + 25
        implicitWidth: text.implicitWidth + 25

        color: "transparent"

        Text {
                id:text

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                

                text: Charge.currentCharge + "%"

                color: Visual.colors.secondaryDark

                font.pointSize: Visual.size.sm
        }
}