import QtQuick 2.12
import QtQuick.Controls 2.12
import Styles 1.0

Rectangle {
    implicitWidth: 16
    implicitHeight: 16

    color: "transparent"
    radius: width / 2
    border.width: 2
    border.color: {
        if (!control.enabled)
            return Style.hint

        if (control.checked || control.highlighted || control.down)
            return Style.accent

        return Style.indicator
    }

    property Item control

    Rectangle {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 8
        height: 8
        visible: control.checked || control.down
        radius: width / 2
        color: {
            if (!control.enabled)
                return Style.hint

            if (control.checked || control.highlighted || control.down)
                return Style.accent

            return Style.indicator
        }
    }
}
