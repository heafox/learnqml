import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import Collage 1.0

Item {
    width: 400
    height: 640

    ColumnLayout {
        anchors.topMargin: 10
        anchors.bottomMargin: 20
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        spacing: 5
        anchors.fill: parent

        TextField {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 60
            font.pixelSize: 16
            text: qsTr("刷卡成功")
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 490

            delegate: RowLayout {
                implicitHeight: 40
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: 40
                    verticalAlignment: Qt.AlignVCenter
                    text: id
                }
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: 40
                    verticalAlignment: Qt.AlignVCenter
                    text: name
                }
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: 220
                    verticalAlignment: Qt.AlignVCenter
                    text: name
                }
                Image {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: 40
                    source: "qrc:/sunlight.png"
                }
            }

            model: collages
        }

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 60
        }
    }
}
