import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    Rectangle {
        width: 100
        height: 24
        color: "gray"

        Label {
            anchors.centerIn: parent
            text: qsTr("B2")
            Rectangle{
                anchors.fill: parent
                color:"red"
                opacity: 0.3
            }
        }
    }
}
