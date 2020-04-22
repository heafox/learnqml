import QtQuick 2.12
import QtQuick.Controls 2.12
import Styles 1.0

Rectangle {
    implicitWidth: 16
    implicitHeight: 16

    color: "transparent"
    radius: 3
    border.width: 2
    border.color: {
        if (!control.enabled)
            return Style.hint

        if (control.visualFocus || control.hovered)
            return Style.accent

        return Style.indicator
    }

    property Item control

    Image {
        id: checkImage
        x: (parent.width - width) / 2 + 3
        y: (parent.height - height) / 2 - 3
        width: 18
        height: 18
        source: "Images/Check.png"
        fillMode: Image.PreserveAspectFit

        scale: control.checkState === Qt.Checked ? 1 : 0
        Behavior on scale { NumberAnimation { duration: 100 } }
    }
}
