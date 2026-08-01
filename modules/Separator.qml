import Quickshell
import QtQuick

import qs.conf

Rectangle{

        implicitWidth: 1
        implicitHeight: 55
        rotation: 90

        gradient: Gradient{
                GradientStop {position: 1.0; color: '#aaacc6'}
                GradientStop {position: 0.5; color: '#666881'}
                GradientStop {position: 0.0; color: '#aaacc6'}
        }
}