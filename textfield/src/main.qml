import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import Styles 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 640

    MyTextField {
        anchors.centerIn: parent
        id: textField
    }
}
