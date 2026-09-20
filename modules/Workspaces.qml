import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.services
import qs.conf
import qs.components

Item{
        
        ColumnLayout {
                id: layout

                spacing: 1
                anchors{verticalCenter: parent.verticalCenter;horizontalCenter: parent.horizontalCenter}
                Separator{anchors{horizontalCenter: layout.horizontalCenter;top: layout.bottom}implicitWidth:38}
                Separator{anchors{horizontalCenter: layout.horizontalCenter;top: layout.top}implicitWidth:38}
        
                Repeater {
                        id: workspaces
                        model: 6
                        
                        // One rectangle per workspace
                        Rectangle {
                                id: ws
                                required property var modelData

                                readonly property bool isFocused: Hyprland.focusedWorkspace.id === modelData + 1
                                
                                Layout.preferredHeight: number.implicitHeight + 25
                                Layout.preferredWidth: number.implicitWidth + 45

                                color: 'transparent'

                                Layout.alignment : Qt.AlignHCenter

                                Text {
                                        id: number
                                        text: modelData + 1
                                        font.pixelSize:Visual.size.bg

                                        anchors{horizontalCenter:parent.horizontalCenter;verticalCenter:parent.verticalCenter}
                                        states: [
                                                State{
                                                        name:"huge"; when: isFocused 
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
                                        }else {
                                                color = Visual.colors.secondary;
                                        }
                                        return color;
                                        }
                                }
                        }
                }
        }
}