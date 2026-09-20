import Quickshell
import QtQuick
import QtQml
import Quickshell.Hyprland

import qs.conf
import qs.components
import qs.services

Item{
        id:item
        property var toggled: false

        
        Rectangle{
                id:interactArea
                implicitWidth:140
                implicitHeight:40
                color: "transparent"
                anchors{horizontalCenter: taskbar.horizontalCenter}

                MouseArea{
                        id:myMouse
                        anchors.fill: interactArea;
                        onClicked:{
                                if (toggled==true){toggled=false}
                                else if (toggled==false){toggled=true}}
                }
        } 

        StyledWindow{
                anchors{top:true;right:true}
                margins{right:12}
         
                implicitWidth: 320
                implicitHeight: 332
                
                mask: Region{height:320;width:320;intersection: Intersection.Xor}
                

                
                Rectangle{
                        id:calendarWindow
                        gradient: Gradient{
                                GradientStop {position: 0.0; color: Visual.colors.bar}
                                GradientStop {position: 0.5; color: Visual.colors.barDark}
                                GradientStop {position: 1;   color: Visual.colors.bar}}
                        implicitWidth: parent.width
                        implicitHeight: parent.height -12
                        radius: Visual.rounding.normal
                        border{color: Visual.colors.barBorder;width: 4}

                        FullDate{

                        }         

                        //moving the calendar out of view and back
                        states: [
                                State{
                                        name:"down"; when: toggled == true  
                                        PropertyChanges { target: calendarWindow; y: 12 }},
                                State{
                                        name:"up"; when: toggled == false
                                        PropertyChanges { target: calendarWindow; y: -320 }}]

                        transitions: Transition {NumberAnimation{properties:"y";easing{type:Easing.InExpo;amplitude:2;period:16}}}             
                }                      
        }
}

