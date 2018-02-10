import QtQuick 2.9
import QtQuick.Window 2.2
import pro.qmake.selector 1.0

Window {
    id: window

    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")

    ContentSelector {
        defaultLandscape: "qrc:/horizontal.qml"
        defaultPortrait: "qrc:/vertical.qml"

        ContentCondition {
            minimumWidth: 800
            minimumHeight: 600
            source: "qrc:/landscape-large.qml"
            orientation: Qt.LandscapeOrientation
        }

        ContentCondition {
            minimumWidth: 600
            minimumHeight: 800
            source: "qrc:/portrait-large.qml"
            orientation: Qt.PortraitOrientation
        }
    }
}
