import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.services
import qs.conf


Item{
        ColumnLayout {
                id: layout

                spacing: 28
                anchors{verticalCenter: parent.verticalCenter;horizontalCenter: parent.horizontalCenter}
        
                Repeater {
                        id: workspaces
                        model: 6
                        
                        // One rectangle per workspace
                        Rectangle {
                                id: ws
                                required property var modelData

                                readonly property bool isFocused: Hyprland.focusedWorkspace.id === modelData + 1
                                
                                Layout.preferredHeight: number.implicitHeight
                                Layout.preferredWidth: number.implicitWidth 

                                color: 'transparent'

                                Layout.alignment : Qt.AlignHCenter


                                Text {
                                        id: number
                                        text: modelData + 1
                                        states: [
                                                State{
                                                        name:"huge"; when: isFocused == true  
                                                        PropertyChanges { target: number; font.pixelSize:Visual.size.hg }},
                                                State{
                                                        name:"big"; when: isFocused == false
                                                        PropertyChanges { target: number; font.pixelSize:Visual.size.bg }}]

                                        transitions: Transition {NumberAnimation{properties:"font.pixelSize";easing{type:Easing.InOutQuart;amplitude:8;period:16}}}     

                                        color: {
                                        let color = "";

                                        if (isFocused) {
                                                color = Visual.colors.highlight
                                        } else if (Hyprland.workspaces.values.find(el => el.id == modelData + 1)) {
                                                color = Visual.colors.secondaryDark;
                                        } else {
                                                color = Visual.colors.secondary;
                                        }
                                        return color;
                                        }
                                }
                        }
                }
        }
}