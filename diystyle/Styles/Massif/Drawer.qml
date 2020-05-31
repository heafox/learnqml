import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.Drawer {
    id: control

    parent: T.Overlay.overlay

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    topPadding: control.edge === Qt.BottomEdge
    leftPadding: control.edge === Qt.RightEdge
    rightPadding: control.edge === Qt.LeftEdge
    bottomPadding: control.edge === Qt.TopEdge

    enter: Transition { SmoothedAnimation { velocity: 5 } }
    exit: Transition { SmoothedAnimation { velocity: 5 } }

    background: Rectangle {
        color: Style.dialog

        layer.enabled: control.position > 0
        layer.effect: DropShadow {
            color: Style.shadow
            samples: !control.interactive && !dim ? 0 : 32
        }
    }

    T.Overlay.modal: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    T.Overlay.modeless: Rectangle {
        color: Style.shadow
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }
}
