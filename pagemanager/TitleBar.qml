import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Pane {
    id: control

    property bool maximize: false
    property alias currentIndex: tabBar.currentIndex

    function showMaximized() {
        window.showMaximized();
        maximize = true;
    }

    function showNormal() {
        window.showNormal();
        maximize = false;
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        property real previousX: 0
        property real previousY: 0

        onPressed: {
            previousX = mouseX;
            previousY = mouseY;
        }

        onPositionChanged: {
            if (maximize)
                return ;
            window.x = window.x + (mouseX - previousX);
            window.y = window.y + (mouseY - previousY);
        }

        onDoubleClicked: maximize ? showNormal() : showMaximized()
    }

    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 4
        spacing: 4

        ToolButton {
            Layout.preferredHeight: 24
            icon.source: "qrc:/icon/config.svg"
            text: qsTr("Configure")
            onClicked: configure.open()
        }

        ToolButton {
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            icon.source: "qrc:/icon/minimize.svg"
            onClicked: window.showMinimized()
        }

        ToolButton {
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            icon.source: maximize ? "qrc:/icon/normal.svg" : "qrc:/icon/maximize.svg"
            onClicked: maximize ? showNormal() : showMaximized()
        }

        ToolButton {
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            icon.source: "qrc:/icon/close.svg"
            icon.color: "red"
            onClicked: Qt.quit()
        }
    }

    TabBar {
        id: tabBar
        anchors.centerIn: parent
        width: 480
        height: parent.height
        position: TabBar.Footer

        TabButton {
            height: parent.height
            font.bold: true
            font.pixelSize: 16
            icon.width: 24
            icon.height: 24
            spacing: 8
            text: qsTr("Page1")
        }

        TabButton {
            height: parent.height
            font.bold: true
            font.pixelSize: 16
            icon.width: 24
            icon.height: 24
            spacing: 8
            text: qsTr("Page2")
        }

        TabButton {
            height: parent.height
            font.bold: true
            font.pixelSize: 16
            icon.width: 24
            icon.height: 24
            spacing: 8
            text: qsTr("Page3")
        }
    }
}
