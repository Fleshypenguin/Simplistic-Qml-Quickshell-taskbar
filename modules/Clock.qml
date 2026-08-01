import Quickshell
import QtQuick
import QtQml

import qs.services
import qs.conf

Rectangle {
        implicitHeight: text.implicitHeight + 15
        implicitWidth: text.implicitWidth + 15

        color: "transparent"

        Text {
                id:text

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                
                text: Time.time

                color: Visual.colors.secondaryDark

                font.pointSize: Visual.size.sm
        }
}