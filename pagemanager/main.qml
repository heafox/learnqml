import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 1320
    height: 760
    title: qsTr("Tabs")

    ColumnLayout {
        clip: true
        spacing: 0

        TabBar {
            id: titleBar
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            Layout.preferredWidth: 1280
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

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 20
            Layout.preferredHeight: 670
            Layout.preferredWidth: 1280

            property int currentIndex: titleBar.currentIndex
            property var currentItem: page1

            onCurrentIndexChanged: {
                currentItem.visible = false;

                currentItem = getItem(currentIndex);

                currentItem.active = true;
                currentItem.visible = true;
            }

            function getItem(index) {
                switch (index) {
                case 0: return page1;
                case 1: return page2;
                case 2: return page3;
                default: break;
                }
                return null;
            }

            Loader {
                id: page1
                anchors.fill: parent
                active: true
                asynchronous: true
                sourceComponent: Page1 { }
            }

            Loader {
                id: page2
                anchors.fill: parent
                active: false
                asynchronous: true
                sourceComponent: Page2 { }
            }

            Loader {
                id: page3
                anchors.fill: parent
                active: false
                asynchronous: true
                sourceComponent: Page3 { }
            }
        }
    }
}
