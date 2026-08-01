import Quickshell
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.services
import qs.conf


Item{
        ColumnLayout {
                id: layout

                spacing: 27

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter 
                

                Repeater {
                        id: workspaces
                        model: 5



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
                                font.pixelSize: isFocused ? Visual.size.hg : Visual.size.bg

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