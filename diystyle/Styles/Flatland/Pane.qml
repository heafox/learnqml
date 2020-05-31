import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Styles 1.0

T.Pane {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    background: Rectangle {
        color: Style.background
        radius: 3

        layer.enabled: control.enabled
        layer.effect: DropShadow {
            verticalOffset: 4
            color: Style.shadow
            samples: 32
        }
    }
}
