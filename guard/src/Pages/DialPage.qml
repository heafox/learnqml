import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Item {
    id: control
    width: 400
    height: 640

    signal inputFace()

    ColumnLayout {
        anchors.topMargin: 10
        anchors.bottomMargin: 20
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        spacing: 5
        anchors.fill: parent

        TextField {
            id: label
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 60
            font.pixelSize: 24
            placeholderText: qsTr("请输入6位开门密码")
            selectByMouse: true
            horizontalAlignment: Qt.AlignHCenter
            echoMode: TextInput.Password
        }

        GridLayout {
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            rowSpacing: 0
            columns: 3
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 490

            Button {
                text: "1"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "1"
            }

            Button {
                text: "2"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "2"
            }

            Button {
                text: "3"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "3"
            }

            Button {
                text: "4"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "4"
            }

            Button {
                text: "5"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "5"
            }

            Button {
                text: "6"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "6"
            }

            Button {
                text: "7"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "7"
            }

            Button {
                text: "8"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "8"
            }

            Button {
                text: "9"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "9"
            }

            Button {
                text: ""
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Button {
                text: "0"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: label.text += "0"
            }

            Button {
                text: "<-"
                font.pointSize: 24
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    var length = label.length;
                    if (length > 0) {
                        label.remove(length - 1, length);
                    }
                }
            }
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
            }

            Button {
                text: qsTr("人脸识别")
                Layout.fillHeight: true
                Layout.fillWidth: true
                icon.source: "qrc:/icon_mima.png"
                icon.color: "transparent"
                onClicked: control.inputFace()
            }
        }
    }
}
