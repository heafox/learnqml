import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

Item {
    id: indicator
    implicitWidth: 38
    implicitHeight: 32

    property Item control
    property alias handle: handle

    Rectangle {
        width: parent.width
        height: 14
        radius: height / 2
        y: parent.height / 2 - height / 2
        color: control.enabled ? (control.checked ? Style.accent : Style.dim) : Style.dim
    }

    Rectangle {
        id: handle
        x: Math.max(0, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)))
        y: (parent.height - height) / 2
        width: 20
        height: 20
        radius: width / 2
        color: {
            if (!control.enabled)
                return Style.hint

            if (control.visualFocus || control.hovered)
                return Style.focus

            return Style.button
        }

        Behavior on x {
            enabled: !control.pressed
            SmoothedAnimation {
                duration: 300
            }
        }

        layer.enabled: control.enabled
        layer.effect: DropShadow {
            verticalOffset: 2
            color: Style.shadow
            samples: 8
        }
    }
}
