pragma Singleton

import Quickshell
import QtQuick


Singleton {
        id: root

        readonly property Colors colors: Colors {}
        readonly property Rounding rounding: Rounding {}
        readonly property FontSize size: FontSize {}

        component Colors: QtObject {
                readonly property string main: "#BEBFCF"
                readonly property string secondary: '#bb46445b'
                readonly property string secondaryDark: '#1b1f2c'
                readonly property string highlight: '#171717'

                
                readonly property string bar: '#8dcfcfe2'
                readonly property string barOpq: '#abb0c4'
                readonly property string barDark: '#e3e3ec'
                readonly property string barBorder: '#262245'
        }

        component Rounding: QtObject{
                readonly property real full: 1000
                readonly property real normal: 20
        }

        component FontSize: QtObject{
                readonly property real sm: 12
                readonly property real md: 18
                readonly property real bg: 24
                readonly property real hg: 42

        }



}