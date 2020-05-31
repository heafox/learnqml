import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.ToolTip {
    id: control

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: implicitHeight

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 8
    padding: 8

    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent

    enter: Transition {
        // toast_enter
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutQuad; duration: 100 }
    }

    exit: Transition {
        // toast_exit
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.InQuad; duration: 200 }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        color: Style.text
    }

    background: Rectangle {
        implicitHeight: 32
        color: Style.dialog
        opacity: 0.95
        radius: 3

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 4
            color: Style.shadow
            samples: 32
        }
    }
}
