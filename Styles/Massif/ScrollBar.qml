import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.ScrollBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: control.interactive ? 1 : 2
    visible: control.policy !== T.ScrollBar.AlwaysOff

    contentItem: Rectangle {
        implicitWidth: control.interactive ? 13 : 4
        implicitHeight: control.interactive ? 13 : 4

        color: {
            if (!control.enabled)
                return Style.dim

            if (control.checked || control.highlighted || control.down)
                return Style.accent

            if (control.visualFocus || control.hovered)
                return Style.focus

            return Style.button
        }
        opacity: 0.0
    }

    background: Rectangle {
        implicitWidth: control.interactive ? 16 : 4
        implicitHeight: control.interactive ? 16 : 4
        color: "#0e000000"
        opacity: 0.0
        visible: control.interactive
    }

    states: State {
        name: "active"
        when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0)
    }

    transitions: [
        Transition {
            to: "active"
            NumberAnimation { targets: [contentItem, background]; property: "opacity"; to: 1.0 }
        },
        Transition {
            from: "active"
            SequentialAnimation {
                PropertyAction{ targets: [contentItem, background]; property: "opacity"; value: 1.0 }
                PauseAnimation { duration: 2450 }
                NumberAnimation { targets: [contentItem, background]; property: "opacity"; to: 0.0 }
            }
        }
    ]
}
