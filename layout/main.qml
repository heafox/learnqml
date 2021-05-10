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
            color: "yellowgreen"
        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50
            color: "chocolate"

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
            color: "yellowgreen"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 90
            Layout.preferredHeight: 50
            color: "chocolate"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 90
            Layout.preferredHeight: 50
            color: "cadetblue"
        }
    }

    GridLayout {
        id: grid
        x: 0
        y: 110
        width: parent.width
        height: parent.height - 110
        //columns: 3
        rows: 2
        flow: GridLayout.TopToBottom
        //layoutDirection: Qt.RightToLeft
        columnSpacing: 5
        rowSpacing: 5

        Text {
            text: "Three"
            font.bold: true
            font.pixelSize: 13
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 90
        }

        Text {
            text: "words"
            color: "red"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 90
        }

        Text {
            text: "in"
            font.underline: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 90
        }

        Text {
            text: "a"
            font.pixelSize: 20
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 90
            //Layout.preferredWidth: 50
            //horizontalAlignment: Text.AlignRight
        }

        Text {
            text: "row"
            font.strikeout: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 90
        }
    }

}
