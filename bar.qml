import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

import qs.conf 
import qs.modules
import qs.components

StyledWindow {
        anchors.bottom: true
        anchors.right: true
        anchors.top: true

        implicitWidth: 80

        color: "transparent"

        Rectangle{
                radius: 10

                width: parent.width - 12
                implicitHeight: parent.height - 24

                border.color: Visual.colors.barBorder
                border.width: 4
                
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                

                
                
                gradient: Gradient{
                        GradientStop {position: 0.0; color: Visual.colors.bar}
                        GradientStop {position: 0.5; color: Visual.colors.barDark}
                        GradientStop {position: 1; color: Visual.colors.bar}
                }



                Clock{
                        id: clock

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        
                        Separator{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.bottom
                        }
                }

                Battery{
                        id: battery

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom

                        Separator{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.top
                        }
                }

                Workspaces{
                        id: workspaces

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                }
        }
}



