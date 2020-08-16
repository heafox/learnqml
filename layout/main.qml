import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    RowLayout {
        onWidthChanged: console.log(width)
        onHeightChanged: console.log(height)
        spacing: 5

        Rectangle {
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50
            color: "green"
        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50
            color: "red"

            Rectangle {
                width: 10
                height: 10
                color: "blue"
            }
        }
    }

    RowLayout {
        x: 0
        y: 55
        width: window.width
        height: 50
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 10
            Layout.preferredHeight: 50
            color: "green"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 90
            Layout.preferredHeight: 50
            color: "red"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 90
            Layout.preferredHeight: 50
            color: "blue"
        }
    }
}
