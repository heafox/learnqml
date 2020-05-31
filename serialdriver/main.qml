import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import Serial 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    SerialDriver {
        id: serial
    }

    Button {
        x: 10
        y: 10
        text: qsTr("Button")
        onClicked: {
            var ok = serial.open("COM3", 115200);
            console.log(ok);
        }
    }
}
