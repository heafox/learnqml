import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Item {
    id: control
    width: 400
    height: 640

    signal inputNumber()
    signal inputPassword()

    ColumnLayout {
        anchors.topMargin: 10
        anchors.bottomMargin: 20
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        spacing: 5
        anchors.fill: parent

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 60
            font.pixelSize: 16
            text: qsTr("刷卡成功")
        }

        Image {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 490
            source: "qrc:/face.jpg"
        }

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 60

            Button {
                text: qsTr("拨号开门")
                Layout.fillHeight: true
                Layout.fillWidth: true
                icon.source: "qrc:/icon_bohao.png"
                icon.color: "transparent"
                onClicked: control.inputNumber()
            }

            Button {
                text: qsTr("密码开门")
                Layout.fillHeight: true
                Layout.fillWidth: true
                icon.source: "qrc:/icon_mima.png"
                icon.color: "transparent"
                onClicked: control.inputPassword()
            }
        }
    }
}
