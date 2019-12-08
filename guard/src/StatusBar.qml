import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Pane {
    implicitWidth: 480
    implicitHeight: 44
    padding: 0

    RowLayout {
        spacing: 0
        anchors.fill: parent

        Label {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("东海花园-福禄居")
            verticalAlignment: Text.AlignVCenter
        }

        ToolButton {
            Layout.fillWidth: false
            Layout.fillHeight: true
            text: qsTr("在线")
            icon.source: "qrc:/network.png"
            icon.color: "transparent"
        }

        ToolButton {
            Layout.fillWidth: false
            Layout.fillHeight: true
            text: qsTr("晴")
            icon.source: "qrc:/sunlight.png"
            icon.color: "transparent"
        }

        ToolButton {
            Layout.fillWidth: false
            Layout.fillHeight: true
            text: qsTr("2019/9/10 星期三")
        }
    }
}
