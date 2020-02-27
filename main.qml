import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    Column {
        ButtonGroup {
            id: childGroup
            exclusive: false
            checkState: parentBox.checkState
        }

        CheckBox {
            id: parentBox
            text: qsTr("Parent")
            checkState: childGroup.checkState
        }

        CheckBox {
            checked: true
            text: qsTr("Child 1")
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
        }

        CheckBox {
            text: qsTr("Child 2")
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
        }
    }
}
