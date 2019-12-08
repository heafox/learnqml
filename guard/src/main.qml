import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import MyClass 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 640
    title: qsTr("Guard")

    MyClass {
        id: myclass
        name: "111"
    }

    Component.onCompleted: {
        myclass.open();
    }

    ColumnLayout {
        anchors.fill: parent

        StatusBar {
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.fillHeight: false
        }

        MainItem {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
