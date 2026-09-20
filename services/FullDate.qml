import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects


import qs.conf
import qs.components

Item{
        implicitHeight: 320
        implicitWidth: 320 
        SystemClock {id: clock;precision: SystemClock.Days}

        Rectangle{
                id:dateHeader
                implicitHeight: text.implicitHeight + 10
                implicitWidth: 320 
                color: "transparent"
                Text {
                        id:text
                        anchors{horizontalCenter: parent.horizontalCenter;verticalCenter: parent.verticalCenter}
                        font.pointSize: Visual.size.sm            
                        text: Qt.formatDate(clock.date, "dth of MMMM, dddd ")
                        Separator{
                                anchors{horizontalCenter:parent.horizontalCenter;verticalCenter: parent.bottom}
                                implicitWidth:300}
                }
        }

        ColumnLayout{
                anchors{top:dateHeader.bottom;horizontalCenter:parent.horizontalCenter}
                spacing:7.5
                Layout.column: 1
                Repeater{
                        model:7
                        Rectangle{
                                id: currentDayWeek
                                implicitHeight: 34
                                implicitWidth: 304
                                radius: Visual.rounding.normal

                                border{color: Visual.colors.highlightTrans;width: 1}
                                


                                gradient: Gradient{
                                        GradientStop {position: 0.0; color: Visual.colors.bar}
                                        GradientStop {position: 0.5; color: Visual.colors.barDarkTrans}
                                        GradientStop {position: 1; color: Visual.colors.bar}
                                        orientation: Gradient.Horizontal
                                }
                                

                                property var daysWeek: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                                property var currentDay: Qt.formatDate(clock.date, "ddd")
                                required property var modelData
                                states: [
                                State{
                                        name:"highlighted"; when: currentDay == daysWeek[modelData]  
                                        PropertyChanges { target: currentDayWeek; opacity:100 }},
                                State{
                                        name:"up"; when: currentDay != daysWeek[modelData]  
                                        PropertyChanges { target: currentDayWeek; opacity:0 }}]
                        }                
                }
                
        }

        RowLayout{
                anchors{top:dateHeader.bottom;left:parent.left}
                
                ColumnLayout {
                        spacing:1
                        Layout.column: 1
                        Layout.fillWidth: true
                        required property var modelData
                        anchors{left:parent.left;bottom:parent.bottom}
                        
                        
                        Repeater{
                                model:7
                                Rectangle{
                                        implicitHeight: 40
                                        implicitWidth: 60
                                        color:"transparent"
                                        
                                        Text{   
                                                anchors{verticalCenter:parent.verticalCenter;horizontalCenter:parent.horizontalCenter}
                                                property var days: ["S","M","T","W","T","F","S"]
                                                text: days[modelData]
                                                font.pixelSize:Visual.size.bg
                                        } 
                                }
                        }                        
                }
                
                Rectangle{
                        implicitHeight: month.height
                        implicitWidth: month.width
                        color:"transparent"
                        anchors{top:parent.top}
                        LayoutMirroring.enabled: true
                        LayoutMirroring.childrenInherit: true

                        MonthGrid {
                                id: month
                                implicitHeight: 280
                                implicitWidth: 280
                                month: Calendar.CurrentMonth
                                year: 2026
                                locale: Qt.locale("en_Uk")
                                rotation : -90
                                leftPadding: -4

                                delegate: Text {
                                        rotation: 90
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        opacity: model.month === month.month ? 1 : 0.3
                                        text: month.locale.toString(model.date, "d")
                                        font.pixelSize:Visual.size.bg

                                        required property var model
                                }
                        }
                }
        }
        
}
        