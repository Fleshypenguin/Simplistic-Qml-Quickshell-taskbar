import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

import qs.conf 
import qs.modules
import qs.components




StyledWindow {
        anchors{bottom: true;right: true;top: true}
        margins{bottom:12;right: 12;top: 12}
        implicitWidth: 68    

        Rectangle{

                radius: Visual.rounding.normal
                width: parent.width
                implicitHeight: parent.height

                border{color: Visual.colors.barBorder; width: 4}
                
                anchors{left: parent.left;verticalCenter: parent.verticalCenter}
                
                gradient: Gradient{
                        GradientStop {position: 0.0; color: Visual.colors.bar}
                        GradientStop {position: 0.5; color: Visual.colors.barDark}
                        GradientStop {position: 1; color: Visual.colors.bar}
                }

                Clock{
                        id: clock

                        anchors{horizontalCenter: parent.horizontalCenter;top: parent.top}
                        
                        Separator{anchors{horizontalCenter: parent.horizontalCenter;verticalCenter: parent.bottom}}
                }

                Battery{
                        id: battery
                        anchors{horizontalCenter: parent.horizontalCenter;bottom: parent.bottom}
                        Separator{anchors{horizontalCenter: parent.horizontalCenter;top: parent.top}}
                }

                Workspaces{
                        id: workspaces
                        anchors{horizontalCenter: parent.horizontalCenter;verticalCenter: parent.verticalCenter}
                        
                }
        }
}
