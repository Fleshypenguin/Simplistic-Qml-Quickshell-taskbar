import Quickshell
import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import qs.conf

Item{
        implicitWidth: parent.width
        implicitHeight: 2
        
        LinearGradient {

                        anchors.fill: parent
                        start: Qt.point(0, 0)
                        end: Qt.point(parent.width, 0)

                        gradient: Gradient{
                                GradientStop {position: 0.0; color: '#00cfcfe2'}
                                GradientStop {position: 0.5; color: '#666881'}
                                GradientStop {position: 1.0; color: '#15cfcfe2'}
                        }
                }
}