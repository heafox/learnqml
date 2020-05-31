import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import Styles 1.0

T.ScrollIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    contentItem: Rectangle {
        implicitWidth: 4
        implicitHeight: 4

        radius: 3
        color: Style.indicator
        visible: control.size < 1.0
        opacity: 0.0

        states: State {
            name: "active"
            when: control.active
            PropertyChanges { target: control.contentItem; opacity: 0.75 }
        }

        transitions: [
            Transition {
                from: "active"
                SequentialAnimation {
                    PauseAnimation { duration: 450 }
                    NumberAnimation { target: control.contentItem; duration: 200; property: "opacity"; to: 0.0 }
                }
            }
        ]
    }
}
