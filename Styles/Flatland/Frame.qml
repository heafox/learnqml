import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import Styles 1.0

T.Frame {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: 1

    background: Rectangle {
        radius: 3
        color: "transparent"
        border.color: Style.hint
    }
}
